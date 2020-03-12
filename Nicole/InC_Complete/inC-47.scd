// ORIGINAL (do not live code on this one)
(
Pbindef(\p46).stop;
Pbindef(\p47,
	\instrument, ~mySynth,
    \degree, Pseq([8, 9, 8], inf),
    \dur, Pseq([0.25, 0.25, 0.5], inf),
    \amp, 0.5,
	// \amp, Pwhite(0.3, 0.6),
    \legato, 0.6
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p46).stop;
Pbindef(\p47,
	\instrument, ~mySynth,
    \degree, Pseq([8, 9, 8], inf),
    \dur, Pseq([0.25, 0.25, 0.5], inf),
    \amp, 0.5,
	// \amp, Pwhite(0.3, 0.6),
    \legato, 0.6
).play(~clock, quant: 1).quant = 1;
)