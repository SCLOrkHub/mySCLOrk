

// ++ code copied from josh
(
Ndef(\thing, {
	var env, snd, freq, preamp;
	freq = 43 * 2;
	preamp = 16;
	env = MouseY.kr(0, (preamp * pi));
	snd = LFTri.ar(freq: freq, mul: env);
	snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd))) * 0.1;
	}).play;
)

// -- end of copied code

// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * rrand(1, 7) + [0, 1];

	snd = Saw.ar(
		freq: freq,
		mul: LFSaw.ar(1).range(0, 0.4)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from jia
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.999, 0.998];
	snd = LFSaw.ar(
		freq: harmonic * 10 * Line.kr(150, 5, 20.5),
		mul: LFTri.ar(1/8).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd)).distort;
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
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.5, 2];

	snd = Saw.ar(
		freq: freq * Line.kr(1, 10, 20),
		mul: LFSaw.ar(2).range(0, 0.4)
	);

	snd = LPF.ar(snd, LFNoise0.ar(8).range(100, 8500));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\b).fadeTime = 2;
Ndef(\b, {
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
		delaytime: 0.01,
		decaytime: 10
	);
	snd = Mix.ar(snd * env * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code
