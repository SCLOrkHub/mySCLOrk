// Load Samples

b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\wow).fadeTime = 0;

Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 1 * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: MouseX.kr(1, 100) * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)
// -- end of copied code
