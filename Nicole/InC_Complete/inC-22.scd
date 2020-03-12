// ORIGINAL (do not live code on this one)
(
Pbindef(\p21).stop;
Pbindef(\p22,
	\instrument, ~mySynth,
    \degree, Pseq([2, 2, 2, 2, 2, 3s, 4, 5, 6], inf),
	\dur, Pseq([Pn(1.5, 8), 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p21).stop;
Pbindef(\p22,
	\instrument, ~mySynth,
    \degree, Pseq([2, 2, 2, 2, 2, 3s, 4, 5, 6], inf),
	\dur, Pseq([Pn(1.5, 8), 0.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)