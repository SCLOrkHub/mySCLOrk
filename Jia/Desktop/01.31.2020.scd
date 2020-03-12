// load samples
b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
(
Ndef(\wow).fadeTime=0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate:-0.5 * BufRateScale.kr(b) * MouseX.kr(0.5, 50),
		trigger: Impulse.kr(3),
		startPos: 0.8 * BufSamples.kr(b) * MouseY.kr(0.0, 0.9),
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
		rate: MouseX.kr(1, 10) * BufRateScale.kr(b),
		trigger: Impulse.kr(3),
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
