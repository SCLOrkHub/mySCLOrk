// ORIGINAL (do not live code on this one)
(
Pbindef(\p22).stop;
Pbindef(\p23,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 3s, 3s, 3s, 3s, 4, 5, 6], inf),
	\dur, Pseq([0.5, Pn(1.5, 7), 1], inf),
	\amp, Pseq([0.68, Pn(0.45, 8)], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p22).stop;
Pbindef(\p23,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 3s, 3s, 3s, 3s, 4, 5, 6], inf),
	\dur, Pseq([0.5, Pn(1.5, 7), 1], inf),
	\amp, Pseq([0.68, Pn(0.45, 8)], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
