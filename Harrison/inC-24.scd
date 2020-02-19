// ORIGINAL (do not live code on this one)
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([ /*scale degrees*/ ], inf),
    \dur, Pseq([ /*note durations*/ ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p23).stop;
Pbindef(\p24,
	\instrument, ~mySynth,
	\degree, Pseq([2, 3s, 4, 4, 4, 4, 4, 5, 6], inf),
	\dur, Pseq([0.5, 0.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 0.5], inf),
	\amp, 0.5,
	\legato, 1
).play(~clock, quant: 1).quant = 1;
)
