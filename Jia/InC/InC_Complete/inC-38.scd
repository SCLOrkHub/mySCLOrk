// ORIGINAL (do not live code on this one)
(
Pbindef(\p37).stop;
Pbindef(\p38,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 0.5
).play(~clock, quant: 1).quant = 1;
)


// COPY (live code on THIS one instead)
(
Pbindef(\p37).stop;
Pbindef(\p38,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6], inf),
    \dur, 0.25,
    \amp, 0.5,
    \legato, 0.5
).play(~clock, quant: 1).quant = 1;
)