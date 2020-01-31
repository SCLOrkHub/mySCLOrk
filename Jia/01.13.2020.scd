SCLOrkChat.new("jia");
(
{ SinOsc.ar(freq: 24.midicps, mul: 0.1) }.play
)\

(
Ndef(\wow, {
	LFSaw.ar(
		freq: MouseX.kr(200, 2000),
		mul: MouseY.kr(0, 0.3)
}
).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * 7+5,
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
		freq: 32 * rrand(20, 30),
		mul: LFTri.ar(freq: 1/30).range(0.01, 0.3) // volume follows triangle shape from 0, 0.5, back to 0 over 10 seconds
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
		freq: MouseX.kr(32, 32 * rrand(1, 32)),
		mul: LFTri.ar(freq: 1/10).range(0.001, 0.3)
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
		freq: MouseX.kr(32, 32 * rrand(1, 32)),
		mul: LFTri.ar(freq: 1/10).range(0.001, 0.3)
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
		freq: 32 * 20+5,
		mul: LFSaw.ar(MouseX.kr(1, 10)).range(0, 0.5)
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
	snd = LFPulse.ar(
		freq: rrand(1,10) * 2 * Line.kr(1, 300, 10.5),
		mul: LFTri.ar(10).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 3; // increasingly squeaky
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: 32 * Line.kr(rrand(1,10), rrand(5, 350), 10.5),
		mul: LFPulse.ar(
			freq: LFNoise0.kr(5).range(1, 20)
		).range(0, 0.5)
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
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: 30 * Line.kr(1.2, 0.8, 0.9, 1),
		mul: LFPulse.ar(0).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1.01, 1.19] * 43 * 1, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/7).range(0.001, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

// ++ code copied from bruno
Ndef(\wow).clear(60);