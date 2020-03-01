// load samples

b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

(
Ndef(\wowsocoolomg).fadeTime = 0;
Ndef(\wowsocoolomg, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 100 * BufRateScale.kr(b), //MouseX.kr(1,2)  * BufRateScale.kr(b), negative rate makes it go backwards
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
		rate: MouseX.kr(1, 10) * BufRateScale.kr(b),
		trigger: Impulse.kr(3),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)
// -- end of copied code
