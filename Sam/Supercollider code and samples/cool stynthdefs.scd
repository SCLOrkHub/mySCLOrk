

(
SynthDef("fm-stab2", {arg freq = 440, cmRatio = 5, modIndex = 20, amp = 0.01, att = 0.01, dec = 0.05, sus = 0.9, rel = 0.1, pan = 0, gate = 1;
	var carrier, modulator, snd, env, modFreq, freqDev;
	env = Env.adsr(
		attackTime: att,
		decayTime: dec,
		sustainLevel: sus,
		releaseTime: rel,
		peakLevel: amp
	).kr(gate: gate);

	modFreq = freq * cmRatio.reciprocal;

	// Using Modulation Index to calculate freqDev
	// from formula index = freqDev/modfreq:
	freqDev = modIndex * modFreq;

	freqDev = Env.perc(
		attackTime: 0.01,
		releaseTime: 0.3,
		level: 1.0,
		curve: 2
	).kr.linlin(0, 1, freqDev, freqDev + 700);

	modulator = SinOsc.ar(freq: modFreq, mul: freqDev);
	carrier = SinOsc.ar(freq: freq + modulator);
	snd = carrier * env;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.4,
		room:  0.3,
		damp: 0.3
	);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)
(
~stab3 = Pbind(
	\instrument, "fm-stab2",
	\dur, Pseq([1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4, 1/4, Rest(2)], 2)*4,
	\midinote, Pseq([24, 24, 26, 26, 25, 25, 24.5, 24.5, \rest], 2),
	\cmRatio, 0.16,
	\modIndex, 2,
	\amp, 0.5
).play;
)