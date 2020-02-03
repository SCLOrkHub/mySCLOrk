// load samples
~samples = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 2 * BufRateScale.kr(b),
		trigger: Impulse.kr(3),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 1.0 * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)
// -- end of copied code
