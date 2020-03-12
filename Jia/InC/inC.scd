// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([2, 3s, 2, 3s, 4, 2, 4, 3s, 2, 3s, 2], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([2, 4, 7], inf),
    \dur, Pseq([3], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, 4, 6, 4, 6], inf),
    \dur, Pseq([0.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([3, 4, 3, 4, 6, 3, 4], inf),
    \dur, Pseq([0.25, 0.25, 0.25, 0.25, 0.25, 3.25, 1.5], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3, \rest], inf),
	\dur, Pseq([0.25, 0.25, Rest(0.5)], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
// ++ code copied from noonan
(
Pbindef(\p4).stop;
Pbindef(\p5,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3], inf),
    \dur, Pseq([0.25], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)