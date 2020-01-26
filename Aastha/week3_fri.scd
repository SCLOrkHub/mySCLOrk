SCLOrkChat.new("aastha");

/*Pbind(\degree, 0).play;

Pbind(
	\degree, Pslide([1,2,5,4],7,3,1),
	\dur, 2
	\amp,
).play;*/

//Scale.directory //use this to tell you what directories you have

/*(
Pbindef(\patterntest,
	// \instrument, "bagpipe",
	//\midinote, Pwhite(60, 72),
	\scale, Scale.harmonicMinor, //define your scale to elsewhere
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], inf), //pbind is gonna go up scales, not counting black keys
	//\degree, Pwhite(-7, 10), //b is flat, s is sharp
	\mtranspose, [0, 2], //starts 1 degree higher and you can build chords
	\dur, 0.25, //pseq([1, 0.1, 0.3], inf), //beats, running at 60bpm, you can specify this, more on that later
	\amp, 0.2 //between 0 and 1
).play;

)

Pbindef(\patterntest).stop;*/


