

// ++ code copied from josh
(
Ndef( \boing2, {
	var snd = SinOsc.ar(VarSaw.ar(freq: [3, 5, 6] , iphase: 0, width: 0.1), 0, 1);
	snd = PMOsc.ar(carfreq: 50, modfreq: LFNoise2.kr(1/3).range(1.5, 10)* 25, pmindex: [0.5, 1.5, 2.5]  * 1/2, mul: snd);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef( \boing2, {
	var snd = SinOsc.ar(VarSaw.ar(freq: [-3, 5, 6], width: 0.1), 0, 1);
	snd = PMOsc.ar(carfreq: -50, modfreq: LFNoise2.kr(1/2).range(1.5, 10)* 20, mul: snd);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code


// ++ code copied from josh
// try flipping pmindex from 9.5 to 1.5 during crest & troughs
(
Ndef( \boing2, {
	var snd = SinOsc.ar(VarSaw.ar(freq: [3, 5, 6] , iphase: 0, width: 0.1), 0, 1);
	snd = PMOsc.ar(carfreq: 50, modfreq: LFNoise2.kr(1/3).range(1.5, 10)* 25, pmindex: [9.5, 2.5, 3.5], mul: snd);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\boing2).fadeTime = 2;
Ndef( \boing2, {
var snd = Clip.ar(VarSaw.ar(freq: 1/23, iphase: 0, width: 0.2), 0, 1);
snd = PMOsc.ar(carfreq: 30, modfreq: LFNoise2.kr(1).range(1.5, 2)*50, pmindex: 1, mul: snd);
	snd = FreeVerb.ar(snd, 0.5, 0.9);
}).play;
)
// -- end of copied code

// ++ code copied from bruno

SCLOrkChat.new("nicole")


(
Ndef(\boing2).fadeTime = 0;
Ndef(\boing2, {
	var snd = Clip.ar(
		in: Pulse.ar(freq: 100, iphase: 0, width: 0.5),
		lo: 0,
		hi: 1
	);
	snd = PMOsc.ar(
		carfreq: 500,
		modfreq: LFNoise0.kr(7).range(10, 20),
		pmindex: MouseX.kr(4, 10),
		mul: snd * LFSaw.ar(10)
	);
	snd = RLPF.ar(
		in: snd,
		freq: LFNoise2.ar(6).range(10, 30),
		rq: 0.01
	);
	snd = snd * LFNoise2.ar(
		freq: MouseY.kr(4, 10).round(1)
	);
	// snd = NHHall.ar(
	// in: [snd, snd],
	// rt60:
}).play
)
// -- end of copied code



// robot chant
// ++ code copied from bruno
(
Ndef(\boing2).fadeTime = 3;
Ndef(\boing2, {
	var snd = Clip.ar(
		in: Saw.ar(freq: 100, iphase: 0, width: 0.15),
		lo: 0,
		hi: 1
	);
	snd = PMOsc.ar(
		carfreq: 20, // 2000
		modfreq: WhiteNoise.kr(1/4).range(190, 200),
		pmindex: MouseX.kr(1, 4),
		mul: snd * LFTri.ar(11)
	);
	snd = RLPF.ar(
		in: snd,
		freq: PinkNoise.ar(3).range(300, 430),
		rq: 0.1
	);
	snd = snd * LFPulse.ar(
		freq: LFTri.ar(330).round(1),
		width: 0.5
	);
	snd = NHHall.ar(
		in: [snd, snd]
	);
	snd = Mix.ar(snd);
}).play
)
// -- end of copied code





// ++ code copied from luken
(
Ndef(\boing2, {
	var snd = PMOsc.ar(
		carfreq: 43 * 2,
		modfreq: 43 * LFNoise0.kr(0.5).range(43 * 2, 43 * 7),
		pmindex: LFNoise0.kr(0.5).range(0, pi / 2)
	);
	snd;
}).play;
)
// -- end of copied code





// ++ code copied from bruno
(
~bufs = Array.newClear(100);
"/home/sclork/Downloads/TR808EmulationKit/*.flac".resolveRelative.pathMatch.do({ |path, i|
	~bufs[i] = Buffer.read(s, path);
});
)
// -- end of copied code


// ++ code copied from bruno
(
~bufs[0].play;
~bufs[13].play;
~bufs[8].play;
)
// -- end of copied code




// ++ code copied from bruno
(

Ndef(\tr, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~bufs[0],
		rate: 1/3,
		trigger: Impulse.ar(1),
		startPos: 0,
		loop: 0
	);
	snd = Mix.ar(snd);
}).play;



Ndef(\tr1, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~bufs[9],
		rate: 3,
		trigger: Impulse.ar(1),
		startPos: 0,
		loop: 0
	);
	snd = Mix.ar(snd);
}).play;

Ndef(\tr2, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~bufs[9],
		rate: 4,
		trigger: Impulse.ar(1),
		startPos: 0,
		loop: 0
	);
	snd = Mix.ar(snd);
}).play;

Ndef(\tr3, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~bufs[5],
		rate: 3,
		trigger: Impulse.ar(1),
		startPos: 0,
		loop: 0
	);
	snd = Mix.ar(snd);
}).play;


)

// -- end of copied code


