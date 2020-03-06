SCLOrkChat.new ("janey");

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
		 Drand([38,45,50,32,36,48,69,50,67, 69, 80, 53, 60], inf).midicps,
		// Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		// Dseq([50,67,48,67,69,65,67, 69, 65, 53, 45,60,67,], inf).midicps
	];
	var trigger = Impulse.kr(4);
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes.choose) * [1, 1.001, 2, 6],
		mul: 0.4,
	);
	snd = LPF.ar(snd, SinOsc.ar(MouseX.kr(1, 12)).range(75, 8000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
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
		attackTime: 1, // attack
		releaseTime: 25, // release
		level: 0.4, // main volume
		curve: -1 // concave or convex shape
	).kr;
	var midinotes = [
		// Dseq([60,67,69,67,69,67,69,65,67, 69, 65, 53, 60], inf).midicps,
		// Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		Drand([69,67,69,67,69,65,67, 69, 65, 53, 60,60,67,] - 24, inf).midicps
	];
	var trigger = Impulse.kr(1/6);
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes.choose) * [1, 1.001, 2, 4],
		mul: 0.4,
	);
	snd = LPF.ar(snd, LFSaw.ar(MouseX.kr(1, 12)).range(150, 7000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.6, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 42 * 3,
		mul: LFSaw.ar(1).range(0, 1)
	)
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var cake = 3;
	SinOsc.ar(
		freq: 40 * cake,
		mul: LFSaw.ar(cake).range(0, 1)
	)
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd, note;
	// try out LFNoise1 and LFNoise2 as well:
	note = 2.pow([0, 3, 1, -2, 5].choose/12);
	harmonic = LFNoise1.kr(2).range(4, 1).round(1); // two harmonics at same time
	snd = Saw.ar(
		freq: 43 * harmonic * [1, 1.001, 0.99] * note,
		mul: SinOsc.ar(4).range(0.01, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
