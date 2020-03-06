// ORIGINAL (do not live code on this one)
(
Pbindef(\p31).stop;
Pbindef(\p32,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 3, 4, 6, 3, 4], inf),
	\dur, Pseq([Pn(0.25, 5), 3.25, 1.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p31).stop;
Pbindef(\p32,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 3, 4, 6, 3, 4], inf),
	\dur, Pseq([Pn(0.25, 5), 3.25, 1.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)