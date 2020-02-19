(
SynthDef("bass", { arg freq = 440, amp = 0.6, att = 0.01, rel = 0.4, pan = 0, gate = 1;
	var snd, snd2, env, env2, harmonics, amplitudes;

	env = Env.asr(att, amp, rel).kr(gate: gate, doneAction: 2);

	harmonics = [1, 2.011, 2.01, 2.98, 2.97, 4.01, 4.98, 6.02];
	amplitudes = [0.9, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

	snd = Saw.ar(freq * harmonics, amplitudes*amp);
	//snd = BPF.ar(snd, freq, 0.5, 2);
	snd2 = SinOsc.ar(freq); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.7) + (snd2 * 0.3);

	snd = snd * env;

	/*snd = FreeVerb.ar(
		in: snd,
		mix: 0.8,
		room: 0.8,
		damp: 0.5,
		mul: 2
	);*/

	snd = Mix.ar(snd);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);

	// 'doneAction: 2' here
	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)

(
Pbindef(\wholeTones,
	\instrument, "bass",
	\scale, Scale.aeolian,
	\midinote, Pseq([Pseries(60, 2, 16), Pseries(61, 2, 16)], inf),
	\dur, 0.25,
	\rel, 3,
	\ctranspose, 0,
	\amp, 0.2,
	\pan, -0.2,
	\legato, 0.8,
	\att, 0.2
).play;
)

(
Pbindef(\wholeTones,
	\instrument, "bass",
	\scale, Scale.aeolian,
	\midinote, Pseq([Pseries([60, 64], [2, 2], 16), Pseries([61, 63], [2, 2], 16)], inf),
	\dur, 0.25,
	\rel, 3,
	\ctranspose, 0,
	\amp, 0.2,
	\pan, -0.2,
	\legato, 0.8,
	\att, 0.2
).play;
)

Pbind(
	\instrument, "bass",
	\scale, Scale.aeolian,
	\midinote, Pseq([Pseries(72, -1, 8)], inf),
	\dur, 2,
	\rel, 1,
	\ctranspose, [-24, -12],
	\amp, 0.3,
	\pan, -0.2,
	\legato, 0.8,
	\att, 0.2
).play;
)