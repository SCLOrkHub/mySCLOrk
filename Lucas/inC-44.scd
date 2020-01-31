// ORIGINAL (do not live code on this one)
(
Pbindef(\p43).stop;
Pbindef(\p44,
	//\instrument, ~mySynth,
    \degree, Pseq([10, 9, 9, 7], inf),
    \dur, Pseq([1/2, 1, 1/2, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
