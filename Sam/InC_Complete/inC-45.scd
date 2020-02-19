// ORIGINAL (do not live code on this one)
(
Pbindef(\p44).stop;
Pbindef(\p45,
	\instrument, ~mySynth,
    \degree, Pseq([8, 8, 4], inf),
    \dur, 1,
	\amp, Pseq([0.5, 0.4, 0.3], inf),
    \legato, 1,
	// \legato, 0.3,
	// \legato, Pseq([1, 1, 0.5], inf),
	// \legato, Pseq([1, 0.5, 0.2], inf)
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p44).stop;
Pbindef(\p45,
	\instrument, ~mySynth,
    \degree, Pseq([8, 8, 4], inf),
    \dur, 1,
	\amp, Pseq([0.5, 0.4, 0.3], inf),
	// try various legato variations:
    \legato, 1,
	// \legato, 0.3,
	// \legato, Pseq([1, 1, 0.5], inf),
	// \legato, Pseq([1, 0.5, 0.2], inf)
).play(~clock, quant: 1).quant = 1;
)