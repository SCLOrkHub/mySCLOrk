SCLOrkJack {


	*new { |action| ^super.new.init(action); }


	init { |argAction| }




	// Returns Array with all available port names, no formatting
	*listRaw {

		^"jack_lsp".unixCmdGetStdOutLines;

	}

	// Returns Array with all available port names, no formatting
	*listRawConnections {

		^"jack_lsp -c".unixCmdGetStdOut;

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
	// Fails silently! Does not post any error message from terminal
	*connect { |from, to|

		("jack_connect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

	}


	// Disconnects two ports.
	// Expects precise port names as strings
	// Fails silently! does not post any error message from terminal
	*disconnect { |from, to|

		("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

	}


	// Use listConnections - do some parsing of incoming lines
	// only way to tell who is connected to who is:
	// if first line does not have a blank space, it is a connector
	// check next line: if starts with blank space, it's connected to previous
	// another line starting with blank? also connected to that previous
	// new line with no blank space? another connector
	// iterate...
	*disconnectAll {

		// ("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

	}

	// Checks if a port is currently available
	*isAvailable { |port|
		^if(this.listRaw.occurrencesOf(port) > 0, { true }, { false });
	}

}



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