// ORIGINAL (do not live code on this one)
(
Pbindef(\p41).stop;
Pbindef(\p42,
	\instrument, ~mySynth,
    \degree, Pseq([7, 6, 5, 7], inf),
    \dur, 4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p41).stop;
Pbindef(\p42,
	\instrument, ~mySynth,
    \degree, Pseq([7, 6, 5, 7], inf),
    \dur, 4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)