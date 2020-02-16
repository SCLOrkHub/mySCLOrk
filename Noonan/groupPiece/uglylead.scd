(
SynthDef("uglylead", { arg amp = 0.5, freq = 330, att = 0.1, dec = 0.1, rel = 0.1, pan = 0, gate = 1, detune = 0.05;
	var snd1, snd2, snd, env;

	env = Env.adsr(att, dec, amp*0.8, rel, amp).kr(gate: gate);

	snd1 = Saw.ar([freq, freq*1.001, freq*2, freq*2.01] + SinOsc.ar(8).range(0 - In.kr(55), 0 + In.kr(55)));
	snd2 = Pulse.ar([freq*0.99, freq] + SinOsc.ar(In.kr(56)).range(0 - In.kr(55), 0 + In.kr(55)), 0.4);
	snd = snd1 + snd2;

	snd = snd*env;

	snd = BPF.ar(snd, SinOsc.ar(16).range(400, 800), 1).distort;

	snd = LPF.ar(snd, 8000);

	snd = FreeVerb.ar(snd, In.kr(57), 0.9, 0.1);

	snd = Mix.ar(snd);
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);

	DetectSilence.ar(snd, doneAction: 2);
}).add;
)


(
Pbindef(\ugly,
	\instrument, "uglylead",
	\midinote, Pseq([
		70, 69, 71, 70, 67, 66, \rest
	], inf),
	\dur, Pseq([1, 0.5, 0.5, 1, 1, 4, Rest(24)], 16),
	\ctranspose, 24,
	\amp, 0.1,
	\detune, 0.015,
	\att, 0.2,
	\dec, 0.3,
	\pan, Pwhite(-1/2, 1/2),
	\legato, 0.9,
	\rel, 1
).play;
)

(
Ndef(\detune, { Out.kr(55, Line.kr(0, 100, 4)) }).play;
Ndef(\speed, { Out.kr(56, Line.kr(4, 20, 4)) }).play;
Ndef(\reverbMix, { Out.kr(57, Line.kr(0.5, 1, 4)) }).play;
)
(
Ndef(\detune, { Out.kr(55, Line.kr(40, 0, 1)) }).play;
Ndef(\speed, { Out.kr(56, Line.kr(20, 4, 1)) }).play;
Ndef(\reverbMix, { Out.kr(57, Line.kr(1, 0.5, 1)) }).play;
)