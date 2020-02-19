// ORIGINAL (do not live code on this one)
(
Pbindef(\p34).stop;
Pbindef(\p35,
	\instrument, ~mySynth,
    \degree, Pseq([
		3, 4, 6, 4,
		6, 4, 6, 4,
		6, 4,
		\rest, // duration 3.5 beats

		6b, 11,
		12, 11, 13,
		12, 11,
		9, 11, 10s,
		\rest, // duration 2.5 beats

		9, 10
	], inf),
	\dur, Pseq([
		Pn(0.25, 4),
		Pn(0.25, 4),
		Pn(0.25, 2),
		Rest(3.5),

		1, 3,
		0.5, 1, 0.5,
		1.5, 0.5,
		3, 0.5, 3.5,
		Rest(2.5),

		2.5, 6
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p34).stop;
Pbindef(\p35,
	\instrument, ~mySynth,
    \degree, Pseq([
		3, 4, 6, 4,
		6, 4, 6, 4,
		6, 4,
		\rest, // duration 3.5 beats

		6b, 11,
		12, 11, 13,
		12, 11,
		9, 11, 10s,
		\rest, // duration 2.5 beats

		9, 10
	], inf),
	\dur, Pseq([
		Pn(0.25, 4),
		Pn(0.25, 4),
		Pn(0.25, 2),
		Rest(3.5),

		1, 3,
		0.5, 1, 0.5,
		1.5, 0.5,
		3, 0.5, 3.5,
		Rest(2.5),

		2.5, 6
	], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)
