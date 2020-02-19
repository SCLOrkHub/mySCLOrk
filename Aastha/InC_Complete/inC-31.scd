// ORIGINAL (do not live code on this one)
(
Pbindef(\p30).stop;
Pbindef(\p31,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, 4, 6, 4, 6], inf),
    \dur, 0.25,
	\amp, 0.5,
	// \amp, Pn(Pseries(0.6, -0.05, 6)).trace,
	// \amp, Pn(Pgeom(0.5, 1.1, 6), inf).trace,
	// \amp, Pseq([0.7, 0.4, 0.4, 0.5, 0.4, 0.4] , inf),
    \legato, 0.8
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p30).stop;
Pbindef(\p31,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, 4, 6, 4, 6], inf),
    \ctranspose, -12,
	\dur, 0.25,
	// try different dynamic shapes:
	\amp, 0.5,
	// \amp, Pn(Pseries(0.6, -0.05, 6)).trace,
	// \amp, Pn(Pgeom(0.5, 1.1, 6), inf).trace,
	// \amp, Pseq([0.7, 0.4, 0.4, 0.5, 0.4, 0.4] , inf),
    \legato, 0.8
).play(~clock, quant: 1).quant = 1;
)