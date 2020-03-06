(
Ndef(\thing, {
	var env, snd, freq, preamp, trig;
	trig = Dust.ar(freq: 10, add: -0.5);
	freq = 21.5 * Latch.ar(WhiteNoise.ar, trig).range(1, 8).round(1);
	preamp = 16;
	env = Sweep.ar(trig, 8 * pi);
	snd = SinOsc.ar(freq: freq, mul: env);
	snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd))) * 0.1;
	}).play;
)

Stethoscope.new

// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq, trig;
	trig = Dust.ar(1, 1, -0.5);
	freq = 43 * Latch.ar(WhiteNoise.ar, trig).range(2, 8).round(1);

	snd = SinOsc.ar(
		freq: freq,
		mul: Sweep.ar(trig, 0.5) * 0.1
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from tan
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 20;
	amp = 0.1;
	rel = 7;
	env = Env.perc(releaseTime: rel, level: 3).ar(doneAction: 2);
	snd = LFTri.ar(freq * LFPulse.ar(1/12).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 3);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\thing).fadeTime = 2;
Ndef(\thing, {
	arg env, snd, freq, amp, rel;
	freq = [22, 69, 65, 75, 74].choose.midicps * [1, 1.001, 0.999, 1.5, 5, 6.7] * Line.kr(1, 1.15, rrand(4, 7));
	amp = 0.4;
	rel = 10;
	env = Env.perc(releaseTime: rel).ar;
	env = env * SinOsc.ar(1/3).range(0.1, 1);
	// env = LFTri.ar(1/4).range(0.5, 1) * LFPulse.ar(rrand(4, 15));
	snd = Pulse.ar(freq * SinOsc.ar(1/6).range(0.9975, 1.025));
	snd = RLPF.ar(snd, SinOsc.ar(1).range(1000, 14000), 0.4);
	snd = Decimator.ar(snd, rrand(10000, 3333), SinOsc.ar(1/3).range(4, 10));
	snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: Line.kr(1, 0.5, 4),
		pitchDispersion: 0.1
	);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.041,
		decaytime: 10
	);
	snd = Mix.ar(snd * env * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code

SCLOrkChat.new("josh");
