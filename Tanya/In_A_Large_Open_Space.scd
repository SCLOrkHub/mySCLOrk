// basic example
// copy paste this code into a new window, go from there
// save interesting snippets of code in a new file (extension .scd)
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	env = Env.triangle(dur: 10, level: 0.5).kr;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = SinOsc.ar(
		freq: 43 * 7, // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

