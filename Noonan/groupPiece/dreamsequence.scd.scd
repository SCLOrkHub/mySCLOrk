(
o = Server.local.options;
o.memSize;
o.memSize = 8192 * 4;
)

SCLOrkChat.new("noonan");



(
SynthDef("Wobbly Organ", { arg freq = 440, amp = 0.1, att = 0.05, rel = 0.01, pan = 0, vibratoSpeed = 8, vibratoAmount = 0.1, gate = 1;
	var snd, env, harmonics, amplitudes, midinote, vibrato;
	env = Env.asr(
		attackTime: att,
		releaseTime: rel
	).kr(doneAction: 2, gate: gate);

	harmonics = [1, 2, 4, 5, 6, 8];
	amplitudes = [-9, -10, -11, -20, -25, -14].dbamp;

	vibrato = SinOsc.kr(vibratoSpeed).range(vibratoAmount.neg, vibratoAmount);
	midinote = (freq * harmonics).cpsmidi + vibrato;

	snd = SinOsc.ar(freq: midinote.midicps, mul: amplitudes*amp);

	snd = LPF.ar(
		in: snd,
		freq: SinOsc.kr(freq: 8).range(freq*4/5, freq*5/4);
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

	harmonics = [1/2, 1, 2, 3, 4, 5];
	amplitudes = [1/2, 1, 1/2, 1/3, 1/4, 1/5];

	snd = LFTri.ar(
		freq: freq*harmonics,
		mul: amplitudes*amp+LFPulse.ar(8).range(-0.075, 0.075)
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

	snd = FreeVerb.ar(in: snd, mix: 0.6, room: 0.8, damp: 1);

	snd = Mix.ar(snd) * env;
	snd = Pan2.ar(snd, pan);
	snd = Limiter.ar(snd);
	Out.ar(0, snd);
}).add;

SynthDef(\cheapPiano1, {
	arg
	//Standard values
	out = 0, freq = 440, amp = 0.1, att = 0.001, rel = 1, pan = 0,
	//These range from 0 to 1
	tone = 0.25, hollowness = 0;

	var hammer, snd, delay, tonefreq, env;

	env = Env.perc(att, rel*0.6, amp * 4, -1).ar(doneAction: 2);

	// Delay line times: freq, freq - 4 cents, freq + 3 cents. In the original this was done by converting freq to midi.
	delay = (1 / (freq * [2.pow(-0.04/12), 1, 2.pow(0.03/12)]));
	tonefreq = tone.linlin(0, 1, 1000, 5000);

	hammer = Decay2.ar(
		in: Impulse.ar(0.001),
		attackTime: 0.008,
		decayTime: 0.04,
		mul: LFNoise2.ar(freq: amp.linlin(0, 1, tonefreq, 2 * tonefreq), mul: 0.25)
	); //Try LFNoise1, LFNoise0, or even LFClipNoise above for a slightly grainier sound.

	snd = CombL.ar(hammer, delay, delay, 50 * amp);
	snd = HPF.ar(snd, hollowness.linlin(0, 1, 50, 1000));
	snd = snd * env;

	snd = Limiter.ar(snd);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "based on something posted 2008-06-17 by jeff, based on an old example by james mcc",
	category: \keyboards,
	tags: [\casio, \piano, \pitched]
	)
).add;
)

(
~clock = TempoClock.new(110/60).permanent_(true);

Pbindef(\organ,
	\instrument, "Wobbly Organ",
	\dur, 8,
	\att, 2,
	\rel, 1,
	\midinote, Pseq([43, 45, 47, 49], inf),
	\legato, 0.9,
	\amp, 0.3,
	\pan, [-0.5, -0.25, 0, 0.25, 0.5]
).play(~clock, quant: 4).quant = 4;
)

(
Pbindef(\wholeTone,
	\instrument, "cheapPiano1",
	\midinote, Pseq([Pseries(57, 2, 8), Pseries(73, -2, 8)], inf),
	\dur, 0.25,
	\ctranspose, 12,
	\amp, Pseq([Pseries(0.05, 0.05, 8), Pseries(0.45, -0.05, 8)], inf)
).play(~clock, quant: 4).quant = 4;
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
	\amp, 0.3,
	\ctranspose, 12
).play(~clock, quant: 4).quant = 4;
)

(
Pbindef(\wholeTone,
	\instrument, "cheapPiano1",
	\midinote, Pseq([Pseries(57, 2, 8), Pseries(73, -2, 8)], inf),
	\dur, 0.25,
	\ctranspose, 12,
	\amp, Pseq([Pseries(0.05, 0.025, 8), Pseries(0.225, -0.025, 8), Pseries(0.05, 0.0125, 8), Pseries(0.1125, -0.0125, 8), Pseries(0.05, 0.00625, 8), Pseries(0.05625, -0.00625, 8)])
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\wholeTone).stop;
Pbindef(\pad).stop;
Pbindef(\organ).stop;