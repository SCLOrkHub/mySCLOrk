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

	// Returns Array with all available port names, no formatting
	*listRawConnections {

		^"jack_lsp -c".unixCmdGetStdOut;

	}

	*collectConnections {

		^"jack_lsp -c".unixCmdGetStdOutLines;

	}


	//







	// Returns Array of ports and types (audio or midi)
	// [<available port>, <port type>, <available port2>, <port2 type> ...]
	*listTypes {

		^"jack_lsp -t".unixCmdGetStdOutLines;

	}

	// Returns Array with all available ports prepended with AUDIO: or MIDI:
	// Prints sorted list on Post Window
	*list {

		var list = this.listTypes.clump(2);

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

		if(this.isAvailable(from).not, {
			("WARNING: could not find port" ++ from).postln;
		});

		if(this.isAvailable(to).not, {
			("WARNING: could not find port " ++ to).postln;
		});



	}

	// Disconnects two ports.
	// Expects precise port names as strings
	*disconnect { |from, to|

		("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

		if(this.isAvailable(from).not, {
			("WARNING: could not find port " ++ from).postln;
		});

		if(this.isAvailable(to).not, {
			("WARNING: could not find port " ++ to).postln;
		});

	}


	// Use listConnections - do some parsing of incoming lines
	// only way to tell who is connected to who is:
	// if first line does not have a blank space, it is a connector
	// check next line: if starts with blank space, it's connected to previous
	// another line starting with blank? also connected to that previous
	// new line with no blank space? another connector
	// iterate...
	*disconnectAll {
		var from;
		this.collectConnections.do({ |port, index|
			if(port.beginsWith(" "), {
				port = this.prDropBeginningWhiteSpace(port);
				this.disconnect(from, port);
			}, {
				from = port;
			})
		});
	}

	// Checks if a port is currently available
	*isAvailable { |port|
		^if(this.collectPorts.occurrencesOf(port) > 0, { true }, { false });
	}




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



} // end of Class code



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