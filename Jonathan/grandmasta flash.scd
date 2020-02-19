// load samples

b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: Saw.ar(1/10).range(1, 20) * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: MouseX.kr(0, 10) * BufSamples.kr(b),
		loop: 1,
	)
}).play;
)

