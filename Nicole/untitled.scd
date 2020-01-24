SCLOrkChat.new("nicole);




// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;

	// try out LFNoise1 and LFNoise2 as well:
	harmonic = Pulse.kr(1).range(-30, 0).round(1); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 3 * harmonic,
		mul: SinOsc.ar(1).range(0, -40)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
