// ORIGINAL (do not live code on this one)
(
Pbindef(\p25).stop;
Pbindef(\p26,
	\instrument, ~mySynth,
    \degree, Pseq([ 2, 3s, 4, 5, 6, 6, 6, 6, 6 ], inf),
    \dur, Pseq([ 0.5, 0.5, 0.5, 0.5, 3/2, 3/2, 3/2, 3/2, 3/2 ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)

(
Pbindef(\p25).stop;
Pbindef(\p26,
	\instrument, ~mySynth,
    \degree, Pseq([ 2, 3s, 4, 5, 6, 6, 6, 6, 6 ], inf),
    \dur, Pseq([ 0.5, 0.5, 0.5, 0.5, 3/2, 3/2, 3/2, 3/2, 3/2 ], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
