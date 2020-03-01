(
b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/children-laugh.wav");
h = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/bruno1.wav");
l = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/life.wav");
u = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/i hate u.wav");
m = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/midterm.wav");
o = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/money.wav");
)

(
Ndef(\childrenlaugh, {
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
Ndef(\childrenlaugh).clear(30);

(
Ndef(\musicbox, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\bagcrackle, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.02, // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
(
Ndef(\knock, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.2, // < play with this number
		decaytime: 5 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\how, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: h,
		rate: BufRateScale.kr(h),
		trigger: Impulse.kr(0),
		startPos: 0 * BufSamples.kr(h),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0, // < play with this number
		decaytime: 0 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\how).clear(10);

(
Ndef(\midterm, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: m,
		rate: BufRateScale.kr(m) * 0.85,
		trigger: Impulse.kr(0),
		startPos: 0 * BufSamples.kr(m),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.01, // < play with this number
		decaytime: 0 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\midterm).clear(10);

(
Ndef(\money, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: o,
		rate: BufRateScale.kr(o) * 0.99,
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(o),
		loop: 1);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.2);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: 0.1, // < play with this number
		decaytime: 0 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\money).clear(10);

(
Ndef(\life, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: l,
		rate: BufRateScale.kr(l) * 1.15,
		trigger: Impulse.kr(0),
		startPos: 0 * BufSamples.kr(l),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1) + (wet * 0.2);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.01, // < play with this number
		decaytime: 0 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\life).clear(10);