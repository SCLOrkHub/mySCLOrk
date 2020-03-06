

// ++ code copied from josh
(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5), 1000, 100)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

(
Ndef(\a).fadeTime = 4;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(5, 10) * [1, 7/6, 3/2, 2];

	snd = Pulse.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(4).range(10, 20)).range(0.1, 0.5), 1000, 100)
	);
	snd = LPF.ar(snd, LFSaw.ar(1/9).range(LFPulse.ar(1/2).range(100, 400), LFPulse.ar(1/2).range(2000, 8000)), 2);
	snd = FreeVerb.ar(snd, 0.3, 0.3, 0.3);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;

Ndef(\b).fadeTime = 4;
Ndef( \b, {
	var snd, freq;
	freq = 43 * rrand(1, 5) * [1, 3/2, 2];

	snd = Pulse.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(1/2).range(1, 4)).range(0.1, 0.5), 1000, 100)
	);
	snd = LPF.ar(snd, 200, 2);
	// snd = FreeVerb.ar(snd, 0.3, 0.3, 0.3);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// -- end of copied code

