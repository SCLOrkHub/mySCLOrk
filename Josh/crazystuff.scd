

// ++ code copied from b2020
(
Ndef(\a).fadeTime = 2;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = MouseY.kr(55, 880).round(55);
	amp = 1;
	rel = 101;
	env = MouseX.kr(0, 15, 0, 0);//Env.perc(attackTime: 101, releaseTime: rel, level: 1, curve: 0).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(0.01, [0, pi/2, pi, 3pi/2]).range(0.975, 1.025));
	snd = Mix.ar(snd) * env;
	snd = Fold.ar(snd, -1, 1).distort.distort;
	snd = RLPF.ar(snd, LinExp.kr(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * 0.1);
	snd = Limiter.ar(snd);
	snd = CombN.ar(snd, 3, 3, 5);
	snd = snd * Slew.ar(LFClipNoise.ar(0.05).range(0, 1), 10, 10);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code
0.3667*6

// ++ code copied from luken
~b = Buffer.alloc(s, 2048, 1)
(
SynthDef.new(\k, {
	var env = Env.perc(0.01, 5).ar(doneAction: 2);
	BufWr.ar(env, ~b, XLine.ar(0.0, 1024, 5));
	env;
}).add;
)

(
~z = Synth.new(\k)
)
// -- end of copied code

// ++ code copied from b2020
(
Ndef(\b).fadeTime = 2;
Ndef(\b, {
	arg env, snd, freq, amp, rel;
	freq = [30, 33].choose.midicps * [1, 1.001, 0.999, 1.5, 5, 6.7] * Line.kr(1, 1.005, rrand(4, 7));
	amp = 0.4;
	rel = 22;
	env = Env.perc(releaseTime: rel).ar;
	env = env * SinOsc.ar(1/3).range(4, 1);
	// env = LFTri.ar(1/4).range(0.5, 1) * LFPulse.ar(rrand(4, 15));
	snd = Saw.ar(freq * SinOsc.ar(1/6).range(0.9975, 1.025));
	snd = RLPF.ar(snd, LFSaw.ar(1/5).range(5000, 14000), 0.14);
	snd = Decimator.ar(snd, rrand(10000, 3333), LFPulse.ar(1).range(4, 10));
	snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: Line.kr(1, 1.1, 10),
		pitchDispersion: 0.1
	);
/*	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 1, //.kr(0.01, 0.2),
		decaytime: 19
	);*/
	snd = FreeVerb.ar(snd, 0.5, 0.9);
	snd = Mix.ar(snd * env * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code
