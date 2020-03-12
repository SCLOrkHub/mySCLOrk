

// ++ code copied from luken
(
Ndef(\boing2, {
	var snd = PMOsc.ar(
		carfreq: 43 * 2,
		modfreq: 43 * LFNoise0.kr(0.5).range(43 * 2, 43 * 7),
		pmindex: LFNoise0.kr(0.5).range(0, pi / 2)
	);
	snd;
}).play;
)
// -- end of copied code
