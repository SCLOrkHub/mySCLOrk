// ORIGINAL (do not live code on this one)
(
Pbindef(\p33).stop;
Pbindef(\p34,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3], inf),
    \dur, 0.25,
    \amp, 0.5,
	// \amp, Pn(Pseries(0.3, 0.05, 10), inf),
    \legato, 0.7
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p33).stop;
Pbindef(\p34,
	\instrument, ~mySynth,
    \degree, Pseq([4, 3], inf),
    \dur, 0.25,
    \amp, 0.5,
	//\amp, Pn(Pseries(0.3, 0.05, 10), inf),
    \legato, 0.7
).play(~clock, quant: 1).quant = 1;
)