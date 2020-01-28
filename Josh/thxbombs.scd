

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	env = Env.perc(60, 60).ar;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = SinOscFB.ar(
		freq: 22.775 * [1.95, 1.8, 1, 2.2, 2.05] * [1, (3 - env)],
		feedback: env * 2.5,//pick your harmonic number here
		mul: env,
	);
	snd = Limiter.ar(Mix.ar(snd));
	snd = CombC.ar(snd, 5, 4 * LFNoise1.ar(0.5).range(0.9, 1.1), 10) + CombC.ar(snd, 5, 3, 10) + snd;
}).play;
)
// -- end of copied code
45.55/

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	env = Env.triangle(dur: 10, level: 0.5).kr;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = SinOsc.ar(
		freq: 45.5 * rrand(1, 8), // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
