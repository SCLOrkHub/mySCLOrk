u = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/i hate u.wav");
m = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/midtermq.wav");
o = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/money.wav");
x = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/good_enough.wav");


/*
(
Ndef(\midterm, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: m,
		rate: BufRateScale.kr(m) * 0.9,
		trigger: Impulse.kr(0),
		startPos: 0.01 * BufSamples.kr(m),
		loop: 0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.8);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: 0.09, // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\midterm).clear(10);*/

/*(
Ndef(\money, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: o,
		rate: BufRateScale.kr(o),
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(o),
		loop: 0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.2);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: LFSaw.ar(0, 0.2), // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\money).clear(10);*/

(
Ndef(\good_enough, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: x,
		rate: BufRateScale.kr(x) * 0.99,
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(x),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.2);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: LFSaw.ar(0, 0.2), // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\good_enough).clear(10);

(
Ndef(\ihateyou, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: u,
		rate: BufRateScale.kr(u),
		trigger: Impulse.kr(0),
		startPos: 0.1 * BufSamples.kr(u),
		loop: 1);
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

Ndef(\ihateyou).clear(10);