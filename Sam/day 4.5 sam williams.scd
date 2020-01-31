
SCLOrkChat.new("sam");


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
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * rrand(20,32),
		mul: LFTri.ar(freq: 10).range(0.1, 0.3)
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
		mul: LFTri.ar(freq: rrand(2, 15)).range(0.001, 0.3)
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
		freq: 32 * rrand(16, 21),
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
	snd = Saw.ar(
		freq: 32 * rrand(1, 10),
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
	var Saw.ar(
		freq: 32 * 1,
		mul: LFSaw.ar(1).range(0, 0.5)
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
	Pulse.ar(
		freq: 32 * 22,
		mul: LFSaw.ar(11).range(0, 0.5)
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
		freq: 32 *
		mul: LFSaw.ar(MouseX.kr(1, 7)).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)


// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: 32 * Line.kr(1, 60, 20),
		mul: LFPulse.ar(Line.kr(1, 30, 20)).range(0, 0.5)
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

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1, 1] * 43 * 1, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1).range(0.001, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code



// ++ code copied from bruno
Ndef(\wow).clear(60);
// -- end of copied code
