// ORIGINAL (do not live code on this one)
(
Pbindef(\p29).stop;
Pbindef(\p30,
	\instrument, ~mySynth,
    \degree, Pseq([7], inf),
    \dur, Pseq([6], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
