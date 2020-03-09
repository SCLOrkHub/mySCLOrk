SCLOrkJack {

	classvar dict;

	*new { |action| ^super.new.init(action); }

	// not sure I'll need this, but keep for now
	*initClass {
		dict = Dictionary.new;
	}

	init { |argAction| }

	// this dict can be accessed and changed through this method
	*returnDict {

		^dict

	}

	// Returns Array with all available port names, no formatting
	*listPorts {

		^"jack_lsp".unixCmd;

	}

	*collectPorts {

		^"jack_lsp".unixCmdGetStdOutLines;

	}

	// List only "source" ports (readable)
	*listSources {
		var sources = Array.new;
		var properties = SCLOrkJack.collectProperties;
		properties.do({ |port, index|
			if(index.even, {
				if(properties[index+1][0]=="output", {
					sources = sources.add(port)
				})
			});
		});
		"=============".postln;
		"Jack Sources:".postln;
		"=============".postln;
		sources.do({|i| i.postln});
	}

	*collectSources {
		var sources = Array.new;
		var properties = SCLOrkJack.collectProperties;
		properties.do({ |port, index|
			if(index.even, {
				if(properties[index+1][0]=="output", {
					sources = sources.add(port)
				})
			});
		});
		^sources;
	}

	// List only "destination" ports (writable)
	*listDestinations {
		var destinations = Array.new;
		var properties = SCLOrkJack.collectProperties;
		properties.do({ |port, index|
			if(index.even, {
				if(properties[index+1][0]=="input", {
					destinations = destinations.add(port)
				})
			});
		});
		"==================".postln;
		"Jack Destinations:".postln;
		"==================".postln;
		destinations.do({|i| i.postln});
	}

	// Returns Array with all available port names, no formatting
	*listConnections {

		^"jack_lsp -c".unixCmdGetStdOut;

	}

	*collectConnections {

		var stdout, from, to, connections, destinations;

		stdout = "jack_lsp -c".unixCmdGetStdOutLines;
		connections = Array.new;
		destinations = Array.new;

		stdout.do({ |port|
			if(port.beginsWith("   "), {
				to = port.drop(3);
				destinations = destinations.add(to);
			}, {
				if(destinations.size > 0, {
					connections = connections.add(destinations)
				});
				destinations = Array.new; // refresh destination list
				connections = connections.add(port); // this port is a from, so add it right away
			})
		});

		// THE ABOVE MAY BE WRONG, lAST DESTINATION ARRAY NEVER GETS ADDED?

		^connections;

	}



	// Returns Array with all available port names, no formatting
	*listProperties {

		^"jack_lsp -p".unixCmdGetStdOut;

	}

	*collectProperties {

		var stdout, line1, line2, properties, props;

		stdout = "jack_lsp -p".unixCmdGetStdOutLines;
		properties = Array.new;

		stdout.do({ |line, index|
			line1 = line;
			line2 = stdout[index+1];

			if(line2.notNil, {
				if(line2.contains("properties"), {
					props = line2.split($:).at(1).split($,);
					props[0] = props[0].drop(1); // drop white space from beginning
					props = props.drop(-1); // drop last item (blank string)
					properties = properties.add(line1.asString);
					properties = properties.add(props);
				})
			});
		});

		^properties;

	}







	// Returns Array of ports and types (audio or midi)
	// [<available port>, <port type>, <available port2>, <port2 type> ...]
	*listTypes {

		^"jack_lsp -t".unixCmdGetStdOutLines;

	}

	// Returns Array with all available ports prepended with AUDIO: or MIDI:
	// Prints sorted list on Post Window
	*list {

		var list = SCLOrkJack.listTypes.clump(2);

		list = list.collect({ |i|
			var port, type;
			port = i[0];
			type = case
			{i[1].asString.containsi("audio")} {"AUDIO"}
			{i[1].asString.containsi("midi")} {"MIDI"}
			{true} {"UNSURE"};
			(type ++ ": " ++ port);
		}).sort;

		^list.do({ |i| i.postln });

	}

	// Connects two ports.
	// Expects precise port names as strings
	*connect { |from, to|

		("jack_connect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

		if(SCLOrkJack.isAvailable(from).not, {
			("WARNING: [connect] could not find port " ++ from).postln;
		});

		if(SCLOrkJack.isAvailable(to).not, {
			("WARNING: [connect] could not find port " ++ to).postln;
		});



	}

	// Disconnects two ports.
	// Expects precise port names as strings
	*disconnect { |from, to|

		("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

		("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").postln;

		if(SCLOrkJack.isAvailable(from).not, {
			("WARNING: [disconnect] could not find port " ++ from).postln;
		});

		if(SCLOrkJack.isAvailable(to).not, {
			("WARNING: [disconnect] could not find port " ++ to).postln;
		});

	}


	// Disconnect all current connections (audio and midi).
	// Array obtained through collectConnections is organized this way:
	// ["from1", ["to1", "to2"], "from2", "from3", ["to6"] ..]
	*disconnectAll {
		var from, to;
		SCLOrkJack.collectConnections.do({ |item|
			if(item.isString, {
				from = item;
			}, {
				if(item.isArray, {
					item.do({ |port|
						to = port;
						SCLOrkJack.disconnect(from, to);
					})
				});
			});
		});
	}

	// Cconnect several ports from a given connections array (audio and midi).
	// Array should be organized this way:
	// ["from1", ["to1", "to2"], "from2", "from3", ["to6"] ..]
	*connectAllFrom { |array|
		var from, to;
		array.do({ |item|
			if(item.isString, {
				from = item;
			}, {
				if(item.isArray, {
					item.do({ |port|
						to = port;
						SCLOrkJack.connect(from, to);
					})
				});
			});
		});
	}

	// Checks if a port is currently available
	*isAvailable { |port|
		^if(SCLOrkJack.collectPorts.occurrencesOf(port) > 0, { true }, { false });
	}

	// Takes a snapshot of all current connections and saves into file.
	// Opens a dialog box for user to choose file name and location.
	*saveCurrentConnections {
		var file, connections;

		connections = SCLOrkJack.collectConnections.asCompileString;
		Dialog.savePanel(
			okFunc: { |path|
				file = File(path,"w");
				file.write(connections);
				file.close;
			},
			cancelFunc: "nevermind".postln;
		);
	}

	*loadConnectionsFromFile { |path|
		var connections, loadFunction;

		loadFunction = { |p|
			["loading", p].postln;
			connections = File.readAllString(p).interpret;
			SCLOrkJack.connectAllFrom(connections);
		};

		if(path.notNil, {
			loadFunction.value(path);
		}, {
			"path was nil, go for dialog".postln;
			Dialog.openPanel(loadFunction);
		});
	}


	// code stolen from SCLOrkQuNeo. Adapt it to use SCLOrkJack methods
	*preset { |symbol|

		switch(symbol,

			\quneo, {
				var pipe = Pipe.new("jack_lsp", "r");
				var line = pipe.getLine; // get the first line right away
				var qOut, qIn;
				var scOut, scIn;

				// go through all available ports (overkill, but OK for now)
				while({ line.notNil }, {
					// make sure it's a string
					line = line.asString;

					// Is this a QuNeo port? If so, save it
					if(line.containsi("QUNEO"), {
						if(line.containsi("capture"), { qOut = line });
						if(line.containsi("playback"), { qIn = line });
					});

					// Is this a SuperCollider MIDI port? If so, save it
					if(line.containsi("a2j:SuperCollider"), {
						if(line.containsi("out0"), { scOut = line });
						if(line.containsi("in0"), { scIn = line });
					});

					// get a new line before while runs again
					line = pipe.getLine;
				});
				pipe.close;
				["qOut", qOut].postln;
				["qIn", qIn].postln;
				["scOut", scOut].postln;
				["scIn", scIn].postln;

				// Make the right connections
				if( (qOut.notNil) && (qIn.notNil) && (scOut.notNil) && (scIn.notNil), {
					("jack_connect \"" ++ qOut ++ "\" \"" ++ scIn ++ "\"").unixCmd;
					("jack_connect \"" ++ qIn ++ "\" \"" ++ scOut ++ "\"").unixCmd;
				}, {
					"Some of the ports could not be found, no connections made".postln;
				})
			},
			\nano, { "nano".postln },
			\rec, { "recording".postln; }
		);




	}

}



/*

// obsolete

// function needed to find number of padding white spaces in string results from terminal
*prFindIndexOfFirstNonWhiteSpace { |string|

var firstIndexThatIsNotWhiteSpace = 0;
var index = 0;
var ascii;

// in case white space comes out as [ 32 ] instead of number 32
ascii = if(string[index].ascii.isNumber, { string[index].ascii }, { string[index][0].ascii });
while( {
ascii==32
}, {
index = index + 1;
firstIndexThatIsNotWhiteSpace = index;
ascii = if(string[index].ascii.isNumber, { string[index].ascii }, { string[index][0].ascii });
});

^firstIndexThatIsNotWhiteSpace;
}

// function needed to drop those padding white spaces from beginning of string
*prDropBeginningWhiteSpace { |string|

^string.drop(this.prFindIndexOfFirstNonWhiteSpace(string));


}



*/
// end of Class code



// old code

/*
var pipe = Pipe.new("jack_lsp", "r");
var line = pipe.getLine; // get the first line right away

// go through all available ports (overkill, but OK for now)
while({ line.notNil }, {
// make sure it's a string
line = line.asString;

line.postln;

// get a new line before while runs again
line = pipe.getLine;
});
pipe.close;

// Make the right connections
if( (qOut.notNil) && (qIn.notNil) && (scOut.notNil) && (scIn.notNil), {
("jack_connect \"" ++ qOut ++ "\" \"" ++ scIn ++ "\"").unixCmd;
("jack_connect \"" ++ qIn ++ "\" \"" ++ scOut ++ "\"").unixCmd;
}, {
"Some of the ports could not be found, no connections made".postln;
})

*/