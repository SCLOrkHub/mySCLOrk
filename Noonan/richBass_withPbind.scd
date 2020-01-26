(
SynthDef("bass", { arg freq = 440, amp = 0.6, att = 0.01, rel = 0.4, pan = 0, gate = 1;
	var snd, snd2, env, env2, harmonics, amplitudes;

	env = Env.asr(att, amp, rel).kr(gate: gate, doneAction: 2);

	harmonics = [1, 2.011, 2.01, 2.98, 2.97, 4.01, 4.98, 6.02];
	amplitudes = [0.9, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

	snd = Saw.ar(freq * harmonics, amplitudes*amp);
	snd2 = SinOsc.ar(freq); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.8) + (snd2 * 0.2);

	snd = HPF.ar(snd, 50);

	snd = snd * env;
	snd = Mix.ar(snd);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);

	// 'doneAction: 2' here
	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)

(
Pbind(
	\instrument, "bass",
	\scale, Scale.aeolian,
	\midinote, Pseq([60, 56, 60, 56, 60, 56, 53, 62], inf),
	\dur, 4,
	\rel, 1,
	\ctranspose, [-36, -24, -12],
	\amp, [0.16, 0.46, 0.26],
	\pan, -0.2,
	\legato, 0.8
).play;
)