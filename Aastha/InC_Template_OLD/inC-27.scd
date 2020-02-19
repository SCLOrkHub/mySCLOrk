// ORIGINAL (do not live code on this one)
(
Pbindef(\p26).stop;
Pbindef(\p27,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 4, 2, 4, 3s, 2, 3s, 2], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)



// ++ code copied from noonan
(
Pbindef(\p26).stop;
Pbindef(\p27,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 4, 2, 4, 3s, 2, 3s, 2], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
// -- end of copied code
