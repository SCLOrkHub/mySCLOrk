

// ++ code copied from bruno
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 2, 4, 6, 8], inf),
	\mtranspose, 12, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 2, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, 1, Pwhite(3, 5), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.4, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code
