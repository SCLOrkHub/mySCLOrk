(
SynthDef("Wobbly Organ", { arg freq = 440, amp = 0.1, att = 0.05, rel = 0.01, pan = 0, vibratoSpeed = 8, vibratoAmount = 0.1, gate = 1;
	var snd, env, harmonics, amplitudes, midinote, vibrato;
	env = Env.asr(
		attackTime: att,
		releaseTime: rel
	).kr(doneAction: 2, gate: gate);

	harmonics = [1, 2, 4, 5, 6, 8, 10, 12];
	amplitudes = [-9, -10, -11, -20, -25, -14, -16, -20].dbamp;

	vibrato = SinOsc.kr(vibratoSpeed).range(vibratoAmount.neg, vibratoAmount);
	midinote = (freq * harmonics).cpsmidi + vibrato;

	snd = SinOsc.ar(freq: midinote.midicps, mul: (amplitudes*amp)*LFSaw.ar(2).range(0, 1));

	snd = LPF.ar(
		in: snd,
		freq: SinOsc.kr(freq: 8).range(freq*0.8, freq*1.25);
	);

	snd = FreeVerb.ar(
		in: snd,
		mix: 0.5,
		room: 0.9,
		damp: 0.9
	);

	snd = Mix.ar(snd) * env;
	snd = Pan2.ar(snd, pan);
	snd = Limiter.ar(snd);
	Out.ar(0, snd);
}).add;

SynthDef("stringish", { arg freq = 440, amp = 0.1, att = 0.05, rel = 0.01, pan = 0, gate = 1;
	var snd, env, harmonics, amplitudes;

	harmonics = [1/2, 1, 2, 3, 4, 5, 6];
	amplitudes = [1/2, 1, 1/2, 1/3, 1/4, 1/5, 1/8];

	snd = LFTri.ar(
		freq: freq*harmonics,
		iphase: LFNoise0.ar(10),
		mul: (amplitudes*amp+LFPulse.ar(8).range(-0.075, 0.075))*LFSaw.ar(3).range(0, 1)
	);

	env = Env.asr(
		attackTime: att,
		releaseTime: rel
	).kr(doneAction: 2, gate: gate);

	snd = BPF.ar(
		in: snd,
		freq: 800,
		rq: 0.5,
		mul: 2
	).distort;

	/*snd = HPF.ar(snd, 600).distort;
	snd = LPF.ar(snd, 1200);*/

	snd = FreeVerb.ar(in: snd, mix: 0.6, room: 0.8, damp: 1);

	snd = Mix.ar(snd) * env;
	snd = Pan2.ar(snd, pan);
	snd = Limiter.ar(snd);
	Out.ar(0, snd);
}).add;
)

(

)

(
Pbindef(\organ,
	\instrument, "Wobbly Organ",
	\dur, 8,
	\att, 2,
	\rel, 1,
	\midinote, Pseq([
		[43, 55, 59, 63, 67],
		[45, 57, 61, 65, 69],
		[47, 59, 63, 67, 71],
		[49, 61, 65, 69, 73],
	], inf),
	\legato, 0.9,
	\amp, 0.5,
	\pan, [-0.5, -0.25, 0, 0.25, 0.5]
).play(~clock, quant: 4).quant = 4;


Pbindef(\pad,
	\instrument, "stringish",
	\dur, 16,
	\att, 8,
	\rel, 1,
	\midinote, Pseq([
		[43, 55, 67],
		[47, 59, 71],
	], inf),
	\legato, 0.9,
	\amp, 0.25,
	\ctranspose, 12
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\pad).stop;
Pbindef(\organ).stop;