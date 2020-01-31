

// ++ code copied from bruno
(
Ndef(\b).fadeTime = 2;
Ndef(\b, {
	arg env, snd, freq, amp, rel;
	freq = [0.001].choose.midicps * [1, 1.001, 0.999, 1.5, 5, 6.7] * Line.kr(1, 1.15, rrand(4, 7));
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
