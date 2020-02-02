// ORIGINAL (do not live code on this one)
(
Pbindef(\p42).stop;
Pbindef(\p43,
	//\instrument, ~mySynth,
    \degree, Pseq([10, 9, 10, 9, 9, 9, 9, 10, 9], inf),
    \dur, Pseq([1/4, 1/4, 1/4, 1/4, 1/2, 1/2, 1/2, 1/4, 1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
