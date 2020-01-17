// basic example
// copy paste this code into a new window, go from there
// save interesting snippets of code in a new file (extension .scd)
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	// env = Env.triangle(dur: 10, level: 0.5).kr;
	env = Pulse.ar(freq: [10, 3, 3.5], width: 0.25).range(0.01, 0.5);
	snd = Pulse.ar(
		freq: 45.55 * [24, 26, 15, 30] * LFSaw.ar(4).range(1, 1.051) * XLine.ar(1, 2, 40), // pick your harmonic number here
		mul: env
	);
	snd = NHHall.ar(Splay.ar(snd)) + snd;
	// snd = LPF.ar(snd, XLine.kr(14000, 100, 10));
	snd = LPF.ar(snd, LFNoise2.ar(1).range(1000, 8400)).distort.tanh;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)