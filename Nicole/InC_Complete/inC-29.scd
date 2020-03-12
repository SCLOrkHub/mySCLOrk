// ORIGINAL (do not live code on this one)
(
Pbindef(\p28).stop;
Pbindef(\p29,
	\instrument, ~mySynth,
    \degree, Pseq([2, 4, 7], inf),
    \dur, 3,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p28).stop;
Pbindef(\p29,
	\instrument, ~mySynth,
    \degree, Pseq([2, -9, -7], inf),
    \dur, 3,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)