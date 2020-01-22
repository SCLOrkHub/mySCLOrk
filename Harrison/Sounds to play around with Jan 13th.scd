SCLOrkChat("Harrison").ne

// ++ code copied from bruno
24.midicps;
// -- end of copied code
SinOsc.ar.play

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32*7+5,
		mul: 0.1
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32*5+7,
		mul: LFTri.ar(freq: 1/10).range(0.1, 0.4)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32*rrand(20,32),
		mul: LFTri.ar(freq: 1/7).range(0.1, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * rrand(1, 32),
		mul: LFTri.ar(freq: 1/10).range(0.001, 0.4)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = .ar(
		freq: 32 * rrand(1, 32),
		mul: Env.perc(releaseTime: 3).kr
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		freq: 32 * 12,
		mul: LFSaw.ar(14).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		freq: 32 * 12,
		mul: LFSaw.ar(8).range(0, 0.5), MouseX.kr
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: 32 * 6,
		mul: LFSaw.ar(MouseX.kr(1, 7)).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from tanya
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = LFSaw.ar(
		freq: 3 * 2 * Line.kr(10, 20, 0.5),
		mul: LFTri.ar(2).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = LFSaw.ar(
		freq: 32 * Line.kr(24, 28, 32),
		mul: LFSaw.ar(12).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = LFSaw.ar(
		freq: 32 * Line.kr(1, rrand(5, 9), 0.5),
		mul: LFTri.ar(
			freq: LFNoise0.kr(1).range(5, 10)
		).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd, env;
	env = Env.perc.ar;
	snd = SinOsc.ar(env * 70, 0, 1);
	snd = LeakDC.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from jia
(
Ndef(\wow).fadeTime = 3;
Ndef(\wow, {
	var snd;
	snd = LFTri.ar(
		freq: 32 * Line.kr(rrand(1,10), rrand(5, 350), 10.5),
		mul: LFPulse.ar(
			freq: LFNoise0.kr(5).range(1, 20)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from nicole
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 30 * Line.kr(1.2, 0.8, 0.9, 1),
		mul: LFPulse.ar(0).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1.001, 0.99] * 43 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/9).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1.001, 0.99] * 43 * 1, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/9).range(0.001, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\wow).clear(60);
// -- end of copied code
