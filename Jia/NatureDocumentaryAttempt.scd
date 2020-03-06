{SinOsc.ar(200, 0, 0.5)}.play;
SCLOrkChat.new("jia");

// LOAD BUFFERS
(
a = Buffer.read(s, "/home/sclork/Downloads/ND_bluebird.flac");
b = Buffer.read(s, "/home/sclork/Downloads/ND_crickets.flac");
c = Buffer.read(s, "/home/sclork/Downloads/ND_frogs.flac");
d = Buffer.read(s, "/home/sclork/Downloads/ND_harmonic rain.flac");
e = Buffer.read(s, "/home/sclork/Downloads/ND_rhythm rain.flac");
)

// TEST
a.play;
b.play;
c.play;
d.play;
e.play;

// TRY
(
Ndef(\wow, {
	var snd, buffer;
	buffer = e;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate: -0.1 * LFTri.kr(-1) * BufRateScale.kr(buffer),
		startPos: 0.3 * BufFrames.kr(buffer),
		loop: 1
	);
	snd = snd * SinOsc.kr(1/3).range(0.1, 0.3)

}).play;

)

// ++ code copied from kait
(
Ndef(\wow, {
	var snd, buffer;
	buffer = b;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate: [0.02, -0.4, 0.06, -0.08] * BufRateScale.kr(buffer),
		startPos: 0.26 * BufFrames.kr(buffer),
		loop: 1
	);
}).play;
)

// ++ code copied from tanya
(
Ndef(\wow, {
	var snd, buffer;
	buffer = a;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  [0.1, 0.5, 1, 2] * BufRateScale.kr(buffer),
		startPos: 0.7 * BufFrames.kr(buffer),
		loop: 1 // 0: one shot play; 1: loop forever
	);
	snd = Mix.ar(snd);
}).play;
)

// ++ code copied from Kevin
(
Ndef(\wow, {
	var snd, buffer;
	buffer = c;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  MouseX.kr(-0.075,-0.82) * BufRateScale.kr(buffer),
		startPos: 0.17 * BufFrames.kr(buffer),
		loop: 1
		);
}).play;
)

// ++ code copied from josh
(
Ndef(\wow, {
	var snd, buffer;
	buffer = c;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  0.5 * BufRateScale.kr(buffer),
		startPos: 0.31 * BufFrames.kr(buffer),
		loop: 1
	);

	snd = Latch.ar(snd, Impulse.ar(MouseX.kr(500, 10000), 0, 2, -1));


}).play;
)

// ++ code copied from luken
(
Ndef(\wow, {
	var t, snd;
	var amp = 0.5;

	t = Dust.ar(2000);

	snd = [
		TGrains.ar(1,
		t,
		a,
		TRand.ar(-1.0, 1.0, t),
		TRand.ar(0.0, 1.0, t),
		0.001,
		amp: amp
	),
	TGrains.ar(1,
		t,
		b,
		TRand.ar(-1.0, 1.0, t),
		TRand.ar(0.0, 1.0, t),
		0.001,
		amp: amp
	),
	TGrains.ar(1,
		t,
		c,
		TRand.ar(-1.0, 1.0, t),
		TRand.ar(0.0, 1.0, t),
		0.001,
 		amp: amp
	),
	TGrains.ar(1,
		t,
		d,
		TRand.ar(-1.0, 1.0, t),
		TRand.ar(0.0, 1.0, t),
		0.001,
		amp: amp
	),
	TGrains.ar(1,
		t,
		e,
		TRand.ar(-1.0, 1.0, t),
		TRand.ar(0.0, 1.0, t),
		0.001,
		amp: amp
	)];
	Mix.ar(snd);
}).play;
)

// ++ code copied from bruno
(
Ndef(\wow, {
	var snd, buffer;
	buffer = b;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  SinOsc.kr(1/8).range(0.04, 0.40).round(0.02) * BufRateScale.kr(buffer),
		startPos: 0.4 * BufFrames.kr(buffer),
		loop: 1
	);
}).play;
)

// ++ code copied from tanya
(
Ndef(\wow, {
	var snd, buffer;
	buffer = b;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  [-0.22, 0.23, -0.24, 0.25, 0.26] * BufRateScale.kr(buffer),
		startPos: 0.1 * BufFrames.kr(buffer),
		loop: 1
	);
	snd = Mix.ar(snd);
}).play;
)

// ++ code copied from kait
(
Ndef(\wow, {
	var snd, buffer;
	buffer = b;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: buffer,
		rate:  SinOsc.kr(10).range(0.01, 0.5, 0.16, 1, 3,  0.40000).round(0.1) * BufRateScale.kr(buffer),
		startPos: 0.2 * BufFrames.kr(buffer),
		loop: 1
	);
}).play;
)

// ++ code copied from bruno
snd = snd * SinOsc.kr(1/3).range(0.1, 0.3)

// ++ code copied from josh
snd = DynKlank.ar(
		`[Array.rand(100, 60, 16000),
		  Array.rand(100, 0.2, 0.7),
		  Array.rand(100, 0.1, 0.25)],
		snd * 0.7) * 0.1;