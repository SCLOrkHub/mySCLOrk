

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd, note;
	// try out LFNoise1 and LFNoise2 as well:
	note = 2.pow([0, 3, 1, -2, 5].choose/12);
	harmonic = LFPulse.kr(2).range(4, 1).round(1); // two harmonics at same timeS
	snd = Saw.ar(
		freq: 43 * harmonic * [1, 1.001, 0.99] * note,
		mul: SinOsc.ar(4).range(0.01, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
