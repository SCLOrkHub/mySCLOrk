// ++ code copied from bruno
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = Pulse.ar(
		freq: 43 * Line.kr(60, 1, 10), // choose harmonic from 1 to 32
		mul: LFPulse.ar(10) // volume
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from josh
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * 20 * [1.05, SinOsc.ar(5).range(1, 2)], // choose harmonic from 1 to 32
		mul: LFNoise1.ar(20).range(0, 0.5) // volume
	);
	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh);
	snd = snd * 20;
	snd = snd.tanh;
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 20, // release
		level: 0.4, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var midinotes = Dseq([68, 69, 60, 53, 60], inf).midicps;
	var trigger = Impulse.kr(19);
	var snd = LFSaw.ar(
		freq: Demand.kr(trigger, 0, midinotes),
		mul: 0.5
	);
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
// move mouse
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 15, // release
		level: 0.4, // main volume
		curve: -1 // concave or convex shape
	).kr;
	var midinotes = [
		// Dseq([60,67,69,67,69,67,69,65,67, 69, 65, 53, 60], inf).midicps,
		// Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		Dseq([69,67,69,67,69,65,67, 69, 65, 53, 60,60,67,], inf).midicps
	];
	var trigger = Impulse.kr(4);
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes.choose) * [1, 1.001, 2],
		mul: 0.4,
	);
	snd = LPF.ar(snd, SinOsc.ar(MouseX.kr(1, 12)).range(200, 8000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 20, // release
		level: 0.4, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var midinotes = Dseq([67, 69, 65, 53, 60] -17, inf).midicps;
	var trigger = Impulse.kr(1);
	var snd = LFSaw.ar(
		freq: Demand.kr(trigger, 0, midinotes),
		mul: 0.5
	);
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
