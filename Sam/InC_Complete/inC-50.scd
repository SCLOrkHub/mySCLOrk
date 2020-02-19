// ORIGINAL (do not live code on this one)
(
Pbindef(\p49).stop;
Pbindef(\p50,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4], inf),
    \dur, 1/4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p49).stop;
Pbindef(\p50,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4], inf),
    \dur, 1/4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)