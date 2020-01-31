// ORIGINAL (do not live code on this one)
(
Pbindef(\p48).stop;
Pbindef(\p49,
	//\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6b, 4, 6b, 4], inf),
    \dur, Pseq([1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
