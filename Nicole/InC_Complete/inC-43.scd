// ORIGINAL (do not live code on this one)
(
Pbindef(\p42).stop;
Pbindef(\p43,
	\instrument, ~mySynth,
    \degree, Pseq([10, 9, 10, 9, 9, 9, 9, 10, 9], inf),
	\dur, Pseq([Pn(1/4, 4), 1/2, 1/2, 1/2, 1/4, 1/4], inf),
	\amp, Pseq([Pn(0.6, 4), 0.55, 0.5, 0.45, 0.37, 0.23], inf),
	\legato, Pseq([Pn(0.8, 4), 0.4, 0.4, 0.4, 0.5, 0.5], inf)
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p42).stop;
Pbindef(\p43,
	\instrument, ~mySynth,
    \degree, Pseq([10, 9, 10, 9, 9, 9, 9, 10, 9], inf),
	\dur, Pseq([Pn(1/4, 4), 1/2, 1/2, 1/2, 1/4, 1/4], inf),
	\amp, Pseq([Pn(0.6, 4), 0.55, 0.5, 0.45, 0.37, 0.23], inf),
	\legato, Pseq([Pn(0.8, 4), 0.4, 0.4, 0.4, 0.5, 0.5], inf)
).play(~clock, quant: 1).quant = 1;
)