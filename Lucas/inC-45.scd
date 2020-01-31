// ORIGINAL (do not live code on this one)
(
Pbindef(\p44).stop;
Pbindef(\p45,
	//\instrument, ~mySynth,
    \degree, Pseq([8, 8, 4], inf),
    \dur, Pseq([1, 1, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
