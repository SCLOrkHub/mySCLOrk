SCLOrkChat.new("Erin")
//Scale.directory
(
Pbindef(\name,
	//	\instrument, "bagpip",
	// \scale, Scale.harmonicMinor
	\degree, Pseq([0,1,2,3],inf), //middle C up by white notes 1,2,3,4
	// can also change degree to midinotes 60 is middle C
	// \mtranspose, [0,2],
	   // can play chords this way
	\dur, Pseq([1,0.1,0.3]),
	\amp, 0, // between 0 and 1
).play
)
Pbindef(\name).stop;