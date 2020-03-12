

// ++ code copied from brun

// ++ code copied from BigZ

(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 0, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 60, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(-4, 100), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.5, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code
 * cmRatio.reciprocal;
	freqDev = modIndex * modFreq;

	modulator = SinOsc.ar(freq: modFreq, mul: freqDev);
	carrier = SinOsc.ar(freq: freq + modulator);
	snd = carrier * env;
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)

(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([-25, 34, -15, -12], inf),
	\mtranspose, Prand([-5, 0, 5, 6], inf),
	\cmRatio, 20.5, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(10, 15), // higher numbers, richer sound
	\amp, Prand([0.1,

// ++ code copied from bruno
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 2, 4, 6, 8], inf),
	\mtranspose, Prand([-5, 0, 5, 6], inf),
	\cmRatio, 2, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, 1, Pwhite(3, 5), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, 0.1, //Pkey(\dur) * 0.4, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(4, 9.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)