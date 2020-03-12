(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	var harmonic = [50, 51, 49] * 3;
	freq = harmonic * Pulse.ar(1/6).range(0.1, 0.8);

	snd = LFPulse.ar(
		freq: freq,
		//mul: Env.triangle(dur: 25).kr; // stops automatically after 20 seconds
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)