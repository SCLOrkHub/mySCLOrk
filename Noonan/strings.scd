(
SynthDef(\strings, {
	arg
	//Standard Definitions
	out = 0, freq = 440, amp = 1, gate = 1, pan = 0, freqLag = 0.2, att = 0.001, dec = 0.1, sus = 0.75, rel = 0.3,
	//Other Controls (mix ranges from 0 - 1)
	rq = 0.001, combHarmonic = 4, sawHarmonic = 1.5, mix = 0.33;

	var env, snd, combFreq;

	combFreq = 1 / (Lag.kr(in: freq, lagTime: freqLag / 8) * combHarmonic);

	env = Env.adsr(att, dec, sus, rel, amp).kr(gate: gate, doneAction: 2);

	snd = SyncSaw.ar(syncFreq: freq * WhiteNoise.kr().range(1/1, 1), sawFreq: freq * sawHarmonic, mul: 8);
	snd = (snd * (1 - mix)) + PinkNoise.ar(180 * mix);
	snd = CombL.ar(snd, combFreq, combFreq, -1); //Try positive 1 for decay time as well.
	snd = Resonz.ar(snd, Lag.kr(in: freq, lagTime: freqLag), rq).abs;
	snd = snd * env;
	snd = BPF.ar(snd, 800, 2, 4);
	snd = Limiter.ar(snd, amp);

	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "Original from Julian Rohrhuber, 2007",
	category: \strings,
	tags: [\pitched]
	)
).add;
)

(
Pbind(
	\instrument, "strings",
    \ctranspose, -12,
    \legato, 0.9,
	\dur, 2,
	\att, 0.1,
	\rel, 0.6,
	\midinote, Pseq([[60, 67, 70, 75], [60, 67, 70, 75], [53, 68, 72, 75], [53, 68, 72, 75]], inf),
	\amp, 0.35,
	\pan, 0
).play;

Pbind(
	\instrument, "strings",
    \legato, 0.9,
	\dur, Pseq([2.5, 0.5, 0.5, 0.5, 3, 4, 1, 4], inf),
	\att, 0.1,
	\rel, 0.6,
	\midinote, Pseq([63, 70, 68, 67, 65, 67, 63, 65], inf),
	\amp, 0.4,
	\pan, 0,
	\ctranspose, 0
).play;
)