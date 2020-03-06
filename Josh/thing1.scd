(
Ndef( \a, {
	var snd;
	snd = SinOsc.ar(120 * 5 * SinOsc.ar(0.3, [0, pi/3, 2pi/3]).range(1, 5).round(1));
	snd = snd * Slew.ar(LFClipNoise.ar(20).range(0, 1), 1000, 1000);
	snd = Limiter.ar(Mix.ar(snd));
}).play
)

// ++ code copied from Lucas
(
Ndef( \a, {
	var snd, freq;
	freq = 47 * [2, 5, 8, 1] * SinOsc.ar(MouseY.kr(2, 20)).range(0.001, 0.21);
	snd = SinOsc.ar(freq);
	snd = BMoog.ar(snd * pi, LFNoise1.ar(MouseX.kr(0.5, 50)).range(20, 20000));
	snd = CombN.ar(snd, 0.5,  SinOsc.ar(0.1).range(0.1, 0.4), 10);
	snd = Limiter.ar(Mix.ar(snd));
}).play
)
// -- end of copied code


// ++ code copied from pneumonia
(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2, 3.4, 4.6, 5.8, 7];

	freq = 50 * harmonics * LFNoise0.ar(1/2).range(1, 5).round(1);

	env = Env.perc(3, 10, 1, 0).ar;

	snd = SinOsc.ar(freq: freq, mul: LFNoise1.ar(20).range(0, 1));

	snd = Decay.ar(snd);
	snd = CombC.ar(snd, 0.5, LFNoise1.ar(103).range(0.1, 0.14), 5);
	snd = FreeVerb.ar(snd, 1, 0.7);
	snd = LPF.ar(snd, LinExp.ar(env, 0, 1, 60, 3000));

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from pneumonia
(
Ndef(\acceptance).fadeTime = 2;
Ndef(\acceptance, {
	var snd, freq;

	freq = 60;

	snd = LFPar.ar(
		freq: freq * [1, LFClipNoise.ar(0.5).range(3, 5), LFClipNoise.ar(0.75).range(7, 9)],
		mul: [0.1, 0.05, 0.025] * VarSaw.ar([0.7, 1, 0.9], 0, SinOsc.ar(0.1).range(0.01, 0.99)).range(0, 1)
	);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// -- end of copied code
