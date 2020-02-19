// ORIGINAL (do not live code on this one)
(
Pbindef(\p51).stop;
Pbindef(\p52,
	\instrument, ~mySynth,
    \degree, Pseq([4, 6b], inf),
    \dur, 1/4,
	\amp, 0.5,
	// \amp, Pseq([0.7, 0.5], inf) * Pseq(Array.geom(12, 1, 0.9).mirror, inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p51).stop;
Pbindef(\p52,
	\instrument, ~mySynth,
    \degree, Pseq([4, 6b], inf),
    \dur, 1/4,
	\amp, 0.5,
	// \amp, Pseq([0.7, 0.5], inf) * Pseq(Array.geom(12, 1, 0.9).mirror, inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)