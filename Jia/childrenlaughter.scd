// ++ code copied from aasthaaa
b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/children-laughing1.wav");

(
Ndef(\childrenlaughter, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: b,
		rate: BufRateScale.kr(b),
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(b),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.7, // < play with this number
		decaytime: 1 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\childrenlaughter).clear(30);