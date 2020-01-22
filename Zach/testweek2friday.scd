
SCLOrkChat('Zach');
// ++ code copied from bruno


// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(5).range(1, 5).round(2); // two harmonics at same time
	snd = Saw.ar(
		freq: 43 * harmonic,
		mul: LFPulse.ar(4).range(0.1, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
