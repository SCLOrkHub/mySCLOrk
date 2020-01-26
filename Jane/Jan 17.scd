

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(8).range(.5, 2).round(1); // two harmonics at same time
	snd = Saw.ar(
		freq: 70 * harmonic,
		mul: LFPulse.ar(4).range(0.1, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
