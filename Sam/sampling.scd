// load samples

b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Sam/Samples/wheels-mono.wav");

(
Ndef (\wow).fadeTime = 0;
Ndef (\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: -6 * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 1.0 * BufSamples.kr(b),
		loop: 1
	)
}).play

)

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: MouseX.kr(1, 1000

		) * BufRateScale.kr(b),
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
		rate: MouseX.kr(1, 10000

		) * BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)
// -- end of copied code
