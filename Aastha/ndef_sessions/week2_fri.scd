SCLOrkChat.new("aastha")

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(1).range(3, 10).round(1); // two harmonics at same time
	snd = Pulse.ar(
		freq: 43 * harmonic,
		mul: SinOsc.ar(MouseX.kr(1, 44)).range(0.0, 0.5)
	);
	snd = LPF.ar(snd, 1400).distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(5).range(1, 2).round(1); // two harmonics at same time
	snd = Saw.ar(
		freq: 43 * harmonic,
		mul: LFPulse.ar(4).range(0.1, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
