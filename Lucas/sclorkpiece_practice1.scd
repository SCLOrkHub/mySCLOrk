

// ++ code copied from josh
(
Ndef( \a, {
	var snd, freq;
	freq = 47 * [2, 5, 8, 1] * SinOsc.ar(2).range(0.01, 0.1);
	snd = SinOsc.ar(freq);
	snd = Limiter.ar(Mix.ar(snd));
}).play
)
// -- end of copied code


(
Ndef( \bargaining, {
	var snd, freq;
	freq = 47 * [2, 5, 8, 1] * SinOsc.ar(MouseY.kr(2/3, 20)).range(0.001, 0.21);
	snd = SinOsc.ar(freq);
	snd = BMoog.ar(snd * pi*MouseX.kr(0.5, 50), LFSaw.ar(5).range(20, 20000));
	snd = Limiter.ar(Mix.ar(snd));
}).play
)

(
Ndef( \acceptance, {
	var snd, env;
	env = Env.perc(releaseTime: 15, curve: -2);
	snd = SinOsc.ar(
		freq: 12000 * 1-LFSaw.ar(15.01).range(1.2, 1),
		phase: SinOsc.ar(MouseX.kr(0, 2)),
		mul: env
);
}).play
)