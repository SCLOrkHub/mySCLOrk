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

// ++ code copied from zach
(
Pbindef(\p21).stop;
Pbindef(\p22,
	\instrument, ~mySynth,
    \degree, Pseq([2, 2, 2, 2, 2, 3s, 4, 5, 6], inf),
    \dur, Pseq([3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// -- end of copied code
