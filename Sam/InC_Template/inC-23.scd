// ORIGINAL (do not live code on this one)
(
Pbindef(\p22).stop;
Pbindef(\p23,
	\instrument, ~mySynth,
    \degree, Pseq([ 2, 3s, 3s, 3s, 3s, 3s, 4, 5, 6], inf),
    \dur, Pseq([ 1/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)

(
Pbindef(\p22).stop;
Pbindef(\p23,
	\instrument, ~mySynth,
    \degree, Pseq([ 2, 3s, 3s, 3s, 3s, 3s, 4, 5, 6], inf),
    \dur, Pseq([ 1/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 3/2, 1], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)