[u, 1, 0.1, 4, 1.1, 0.01, 1, 0.2, 0.2, 1]

// ++ code copied from aastha
(
Ndef(\ihateyou, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: u,
		rate: BufRateScale.kr(u),
		trigger: Impulse.kr(0),
		startPos: 0.1 * BufSamples.kr(u),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.01);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: 0.2, // < play with this number
		decaytime: 1 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


[r, 0.988, 0.0, 4, 1.1, 3, 1, 0.1, 0.1, 2]
// ++ code copied from aastha
(
Ndef(\ringaroundtherosies, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: r,
		rate: BufRateScale.kr(r) * 0.988,
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(r),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 3);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: 0.1, // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


