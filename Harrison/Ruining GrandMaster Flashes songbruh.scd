//Original Code
(
Ndef(\yeezyseason).fadeTime = 2;
Ndef(\yeezyseaspm, {
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



//code to mess with
(
Ndef(\yeezyseason).fadeTime = 2;
Ndef(\yeezyseaspm, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: 1 * BufRateScale.kr(b),
		trigger: Impulse.kr(2.25),
		startPos: 0.0 * BufSamples.kr(b),
		loop: 1
	)
}).play;
)