Document.closeAll;

// load samples

b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: LFPulse.kr(4).range(1, 1.5) * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)


(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 1.0 * BufRateScale.kr(b),
		trigger: Impulse.kr(7),
		startPos: LFNoise0.kr(1).range(0.5, 1).poll * BufSamples.kr(b),
		loop: 0
	)
}).play;
)








	