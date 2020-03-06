SCLOrkChat.new("aastha");

b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/children-laughing1.wav");
g = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/goodnight2.wav");
h = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/highlaughing.wav");
l = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/lowlaughing.wav");
a = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/alarm.wav");
r = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/ring2.wav");

// COMMENTED BECAUSE JIA IS DOING THIS:
// // children laughing
// (
// Ndef(\childrenlaughter, {
// 	arg dry, wet, snd;
// 	dry = PlayBuf.ar(
// 		numChannels: 1,
// 		bufnum: b,
// 		rate: BufRateScale.kr(b),
// 		trigger: Impulse.kr(0),
// 		startPos: 0.2 * BufSamples.kr(b),
// 		loop: 1
// 	);
// 	wet = NHHall.ar(
// 		in: dry!2,
// 		rt60: 4
// 	);
// 	snd = (dry * 1.0) + (wet * 0.3);
// 	snd = snd + CombC.ar(
// 		in: snd,
// 		maxdelaytime: 1,
// 		delaytime: 0.5, // < play with this number
// 		decaytime: 5 // < and this number
// 	);
// 	snd = Limiter.ar(Mix.ar(snd));
// }).play;
// )
// def(\childrenlaughter).clear(30);


// noonan's goodnight:
(
Ndef(\goodnight, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: g,
		rate: BufRateScale.kr(g),
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(g),
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
		delaytime: 0.5, // < play with this number
		decaytime: 5 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\goodnight).clear(60);


// creepy laughter 1 -- high
(
Ndef(\laugh1, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: h,
		rate: BufRateScale.kr(h) * MouseX.kr(1,2),
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(h),
		loop: 1);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\laugh1).clear(30);


// creepy laughter 2 -- low

(
Ndef(\laugh2, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: l,
		rate: BufRateScale.kr(l) * MouseX.kr(1,2) * 1.2,
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(l),
		loop: 1);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\laugh2).clear(30);


// sreya's sis singing ring around the rosies
(
Ndef(\ringaroundtherosies, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: r,
		rate: BufRateScale.kr(r) * 0.888,
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(r),
		loop: 1);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 3);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: 0, // < play with this number
		decaytime: 2 // < and this number
	) + MouseX.kr(1, 2);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\ringaroundtherosies).clear(30);


// I would say goodnight but this time it's
(
Ndef(\mic, {
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


// goodbye
(
Ndef(\mic, {
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
		delaytime: 0.3, // < play with this number
		decaytime: 5 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef(\mic).stop;

// alarm sound
Ndef.clear(20);

(
Ndef(\alarm, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: a,
		rate: BufRateScale.kr(a),
		trigger: Impulse.kr(0),
		startPos: 0.0 * BufSamples.kr(a),
		loop: 1);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 1.4);
	snd = Limiter.ar(Mix.ar(snd));
}).play;

)

Ndef(\alarm).clear(30);


