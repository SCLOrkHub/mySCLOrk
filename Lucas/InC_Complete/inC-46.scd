// ORIGINAL (do not live code on this one)
(
Pbindef(\p45).stop;
Pbindef(\p46,
	\instrument, ~mySynth,
    \degree, Pseq([
		4, 8, 9, 8,
		Pseq([\rest, 4], 3),
		4, 8, 9, 8
	], inf),
	\dur, Pseq([
		Pn(0.25, 4),
		Pseq([Rest(0.5), 0.5], 3),
		Pn(0.25, 4)
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p45).stop;
Pbindef(\p46,
	\instrument, ~mySynth,
    \degree, Pseq([
		4, 8, 9, 8,
		Pseq([\rest, 4], 3),
		4, 8, 9, 8
	], inf),
	\dur, Pseq([
		Pn(0.25, 4),
		Pseq([Rest(0.5), 0.5], 3),
		Pn(0.25, 4)
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)