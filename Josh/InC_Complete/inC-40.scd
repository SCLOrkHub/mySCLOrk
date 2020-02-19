// ORIGINAL (do not live code on this one)
(
Pbindef(\p39).stop;
Pbindef(\p40,
	\instrument, ~mySynth,
    \degree, Pseq([6, 3], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)


// COPY (live code on THIS one instead)
(
Pbindef(\p39).stop;
Pbindef(\p40,
	\instrument, ~mySynth,
    \degree, Pseq([6, 3], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)