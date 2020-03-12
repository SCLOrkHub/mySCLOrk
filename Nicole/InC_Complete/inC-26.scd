// ORIGINAL (do not live code on this one)
(
Pbindef(\p25).stop;
Pbindef(\p26,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 4, 5, 6, 6, 6, 6, 6], inf),
	\dur, Pseq([Pn(0.5, 4), Pn(1.5, 5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p25).stop;
Pbindef(\p26,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 4, 5, 6, 6, 6, 6, 6], inf),
	\dur, Pseq([Pn(0.5, 4), Pn(1.5, 5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)