SCLOrkChat("Harrison").new


(
Pbindef(\thebigday,
	//\instrument,"bagpipe",
	\degree, Pseq([1, 2, 3, 4], inf),
	//\midinote, Pwhite(60, 72),
	//\scale, Scale.harmonic/MelodicMinor,
	//\mtranspose, [0, 2],
	//s and b after numbers are sharps and flats
	\dur, Pseq([1, 0.2, 0.4, 0.3], inf) * 0.5,
	\amp, Pwhite(0.01, 0.5)
).play
)

Pbindef(\thebigday).stop;