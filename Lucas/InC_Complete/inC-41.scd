// ORIGINAL (do not live code on this one)
(
Pbindef(\p40).stop;
Pbindef(\p41,
	\instrument, ~mySynth,
    \degree, Pseq([6, 4], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)


// COPY (live code on THIS one instead)
(
Pbindef(\p40).stop;
Pbindef(\p41,
	\instrument, ~mySynth,
    \degree, Pseq([6, 4], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)