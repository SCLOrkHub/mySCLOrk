SCLOrkJack {


	*new { |action| ^super.new.init(action); }


	init { |argAction| }



	// Dictionary.new

	*list {

		^"jack_lsp".unixCmdGetStdOutLines;

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
	}

	*connect { |from, to|

		^("jack_connect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

	}


	*disconnect { |from, to|

		("jack_disconnect \"" ++ from ++ "\" \"" ++ to ++ "\"").unixCmd;

	}

}