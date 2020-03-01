SCLOrkChat.new("aastha");

b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/children-laughing1.wav");
g = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/goodnight2.wav");
h = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/highlaughing.wav");
l = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/lowlaughing.wav");
a = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/alarm.wav");
r = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/ring2.wav");
u = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/i hate u.wav");
m = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/midtermq.wav");
o = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/money.wav");
x = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/good_enough.wav");

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


// bass sound
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 40, //* MouseX.kr(0.5, 2),
		mul: SinOsc.ar(1).range(0, 1) //* Pulse.ar(4) * MouseX.kr(1, 12)
	)
}).play;

)

// PLAY STRINGS IN OTHER FILE!!


// //strings
// (
// Ndef(\wow).fadeTime = 8;
// Ndef(\wow, {
// 	var snd, harmonic;
// 	harmonic = ([1, 1.001, 0.99, 2, 4, 8] + 20)* SinOsc.ar(1).range(0.99, 1.01);
// 	snd = Saw.ar(
// 		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
// 		mul: 0.1//SinOsc.ar([1/5, 1/2, 1/5, 1/2, 5]).range(0.1, 0.5)*[0.1, 1, 1, 0.8, 0.4,0.9]
//
// 	);
// 	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
// 	snd = Limiter.ar(Mix.ar(snd))
// }).play;
// )
//
//
//
// //darker strings
// (
// Ndef(\wow).fadeTime = 8;
// Ndef(\wow, {
// 	var snd, harmonic;
// 	harmonic = [1, 1.001, 0.99, 2, 4, 8] * SinOsc.ar(1).range(0.99, 1.01);
// 	snd = Saw.ar(
// 		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
// 		mul: SinOsc.ar([1/5, 1/2, 1/5, 1/2, 5]).range(0.1, 0.5)*[0.1, 1, 1, 0.8, 0.4, 0.9]
// 	);
// 	snd = Limiter.ar(Mix.ar(snd))
// }).play;
// )

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

// find a way to lower strings and bass here if possible

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

Ndef(\ihateyou).clear(10);


// sreya's sis singing ring around the rosies
(
Ndef(\ringaroundtherosies, {
	arg dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: r,
		rate: BufRateScale.kr(r) * 0.988,
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
		delaytime: 0.1, // < play with this number
		decaytime: 2 // < and this number
	);
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

// STOP EVERYTHING THAT IS PLAYING!!!!
Ndef.clear(20);

// alarm sound
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

Ndef(\alarm).clear(30); // done yo


