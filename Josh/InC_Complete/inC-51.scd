// ORIGINAL (do not live code on this one)
(
Pbindef(\p50).stop;
Pbindef(\p51,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6b], inf),
    \dur, 1/4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p50).stop;
Pbindef(\p51,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6b], inf),
    \dur, 1/4,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)