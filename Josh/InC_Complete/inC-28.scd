// ORIGINAL (do not live code on this one)
(
Pbindef(\p27).stop;
Pbindef(\p28,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 2, 2], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.75, 0.25], inf),
	\amp, Pwhite(0.4, 0.5),
    \legato, 0.9
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p27).stop;
Pbindef(\p28,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 2, 2], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.75, 0.25], inf),
	\amp, Pwhite(0.4, 0.5),
    \legato, 0.9
).play(~clock, quant: 1).quant = 1;
)