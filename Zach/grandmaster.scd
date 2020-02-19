

// load samples
b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 1/10 * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.6 * BufSamples.kr(b),
		loop: 1; // yes or no for loop
	)
}).play;
)
