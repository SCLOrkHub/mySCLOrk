(
SynthDef("FM-env", {arg freq = 440, cmRatio = 3, modIndex = 0, amp = 0.01, att = 0.01, dec = 0.05, sus = 0.9, rel = 0.1, pan = 0, gate = 1;
	var carrier, modulator, modFreq, freqDev, snd, env;
	env = Env.adsr(
		attackTime: att,
		decayTime: dec,
		sustainLevel: sus,
		releaseTime: rel,
		peakLevel: amp
	).kr(gate: gate);

	// modIndex always ramps down to 1 over attack duration
	modIndex = Line.kr(modIndex, 1, att*2);

	modFreq = freq * cmRatio.reciprocal;
	freqDev = modIndex * modFreq;

	modulator = SinOsc.ar(freq: modFreq, mul: freqDev);
	carrier = SinOsc.ar(freq: freq + modulator, mul: LFSaw.ar(256).range(0, 1));
	snd = carrier * env;
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)

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
	\att, 4,
	\dec, 0.1, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(4, 7.0)*2
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code
(
Pbindef(\cloudsWeird,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 0, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, Pseries(2, 3, 16), // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pseries(40, -0.41, 32), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.4, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 7.0)*8
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)