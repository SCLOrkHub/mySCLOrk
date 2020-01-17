SCLOrkChat.new("tanya");
{SinOsc.ar}.play;



// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	chan = [1, 2.01, 1.02, 3]
	harmonic = xLine.kr(9, 19) * LFNoise0.kr(3).range(1, 10).round(2); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * chan * harmonic,
		mul: SinOsc.ar(9).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
// badihsvahdvsad


(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	chan = [1, 6.01, 1.02, 3];
	harmonic = LFNoise1.kr(31).range(1, 100).round(2); // two harmonics at same time
	snd = LFPulse.ar(
		freq: 43 * chan * harmonic,
		mul: SinOsc.ar(9).range(0, 0.5)
	);
	// snd = BPF.ar(snd, 430);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
