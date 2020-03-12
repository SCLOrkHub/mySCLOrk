// ORIGINAL (do not live code on this one)
(
Pbindef(\p47).stop;
Pbindef(\p48,
	\instrument, ~mySynth,
    \degree, Pseq([4, 4, 3], inf),
    \dur, Pseq([6, 4, 5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p47).stop;
Pbindef(\p48,
	\instrument, ~mySynth,
    \degree, Pseq([4, 4, 3], inf),
    \dur, Pseq([6, 4, 5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)