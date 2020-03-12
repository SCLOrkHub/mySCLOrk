

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFSaw.kr(15).range(1, 15).round(2); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * harmonic + [0, MouseX.kr(0, 4)],
		mul: LFNoise2.ar(5).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise1.kr(15).range(-10, 30).round(-10); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 43 * harmonic + [Line.kr(-200, 200, 5)],
		mul: LFSaw.ar(4).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, 1000).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
