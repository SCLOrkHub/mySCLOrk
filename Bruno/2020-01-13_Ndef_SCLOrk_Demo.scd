SCLOrkChat.new("bruno", true);

24.midicps * 7

(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1, 1] * 43 * 1, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/9).range(0.001, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

Ndef(\wow).clear(60);




// ++ code copied from tanya
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: 32 * Line.kr(1, rrand(8, 23), 0.5),
		mul: LFPulse.ar(
			freq: LFNoise0.kr(1).range(9, 19)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code
