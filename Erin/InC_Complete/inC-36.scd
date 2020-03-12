// ORIGINAL (do not live code on this one)
(
Pbindef(\p35).stop;
Pbindef(\p36,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6, 4, 6, 4], inf),
    \dur, 0.25,
	\amp, Pseq([0.6, 0.5, 0.48, 0.45, 0.43, 0.36], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)


// COPY (live code on THIS one instead)
(
Pbindef(\p35).stop;
Pbindef(\p36,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6, 4, 6, 4], inf),
    \dur, 0.25,
	\amp, Pseq([0.6, 0.5, 0.48, 0.45, 0.43, 0.36], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)