Document.closeAll;

//load samples

b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\yeezyseason).fadeTime = 0;
Ndef(\yeezyseaspm), {
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