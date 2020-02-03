(
b = Buffer.read(s, "/home/sclork/Downloads/short-drone-mono.wav");
c = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
)

(
Ndef(\b).fadeTime = 1;
Ndef(\b, {
	var snd, buf;

	buf = SinOsc.ar(4);

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: c,
		rate: Saw.ar(SinOsc.ar(2).range(1/4, 4)).range(-20, 20) * BufRateScale.kr(c),
		trigger: Impulse.kr(20),
		startPos: 0.5 * BufSamples.kr(b),
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
		bufnum: c,
		rate: Saw.kr(40) * BufRateScale.kr(c),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(c),
		loop: 1
	)
}).play;
)
// -- end of copied code
