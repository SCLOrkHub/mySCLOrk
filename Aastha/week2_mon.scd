//SCLOrkChat("Aastha");

// ++ code copied from bruno
// 24.midicps;
// -- end of copied code
//32 oscillations per second  -- 32 is the low frequency, the fundamental freq, 7th harmonic of that low C is 32*7 = 228


// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;//cross fade between old and new sound
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: (32*7 + 5), //freq is so low that it's barely audible - you can sort of feel/hear it
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
		freq: (32* rrand(20, 32)),
		mul: LFTri.ar(freq: 1/4).range(0.001, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

// -- end of copied code
//LTF this messes with the volume, makes it oscillate - it follows a triangle shape from 0 up to 0.5 back to 0 over 10 seconds

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * rrand(1, 32),
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
	snd = SinOsc.ar(
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
	var snd;
	snd = Pulse.ar(
		freq: 32 * 2,
		mul: LFSaw.ar(1).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code'



// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		freq: 32 * 1,
		mul: LFSaw.ar(MouseX.kr(1, 7)).range(0, 0.5)
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
	snd = LFPulse.ar(
		freq: 32 * Pulse.kr(1, 8, 0.9),
		mul: LFPulse.ar(2).range(0, 0.5)
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
	snd = LFPulse.ar(
		freq: 32 * Line.kr(1, rrand(5, 9), 0.5),
		mul: LFPulse.ar(
			freq: LFNoise0.kr(1).range(5, 10)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from jia
(
Ndef(\wow).fadeTime = 3;
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
		freq: [1, 1, 1] * 10 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/5).range(0.001, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

{SinOsc.ar}.play;



// ++ code copied from bruno
Ndef(\wow).clear(60);
// -- end of copied code
