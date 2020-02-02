// ORIGINAL (do not live code on this one)
(
Pbindef(\p32).stop;
Pbindef(\p33,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, \rest], inf),
	\dur, Pseq([0.25, 0.25, Rest(0.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)


// ++ code copied from noonan
(
Pbindef(\p32).stop;
Pbindef(\p33,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, \rest], inf),
	\dur, Pseq([0.25, 0.25, Rest(0.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
// -- end of copied code
