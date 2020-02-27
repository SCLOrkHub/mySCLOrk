SCLOrkChat.new("josh")

// ++ code copied from bruno
(
// move mouse
Ndef(\b).fadeTime = 3;
Ndef(\b, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 15, // release
		level: 0.4, // main volume
		curve: -1 // concave or convex shape
	).kr;
	var midinotes = [
		// Dseq([60,67,69,67,69,67,69,65,67, 69, 65, 53, 60], inf).midicps,
		// Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		Drand(([62, 65, 62, 67, 69, 62, 65, 63] - 24), inf).midicps
	];
	var triggera = Impulse.kr(4);
	var snda = SinOscFB.ar(
		freq: Demand.kr(triggera, 0, midinotes.choose) * SinOsc.ar(MouseY.kr(0.01, 12), [0, pi]).range(0.99, 1.01),
		feedback: 1.4 + env,
		mul: 0.4,
	);
		var triggerb = Impulse.kr(16);

		var sndb = SinOscFB.ar(
		freq: Demand.kr(triggerb, 0, midinotes.choose) * [2 * 3] * SinOsc.ar(MouseY.kr(0.01, 12), [0, pi]).range(0.99, 1.01),
		feedback: 1.4 + env,
		mul: 0.4,
	);
	snda = FreeVerb.ar(snda, 0.5, 0.9, 0.4);
	snda = BRF.ar(snda, [1, 2, 3, 4] * SinOsc.ar(MouseX.kr(0.01, 12)).range(200, 3000), 1.25);
	snda = snda * env;

	sndb = FreeVerb.ar(sndb, 0.5, 0.9, 0.4);
	sndb = BRF.ar(sndb, [1, 2, 3, 4] * SinOsc.ar(MouseX.kr(0.01, 12)).range(200, 3000), 1.25);
	sndb = sndb * env;
	snda = Mix.ar([snda, sndb]);
	snda = Limiter.ar(snda);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd, cake = [1, 1.5, 2, 3, 4];
	snd = SinOscFB.ar(
		freq: 40 * cake,
		feedback: LFSaw.ar(cake).range(0, 1.5),
		mul: 1
	);
	snd = SinOsc.ar(0, snd * pi * 4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 2;
Ndef(\a, {
	var notes = [
		[67, 69, 65, 53, 60],
		[67, 69, 64, 53, 60],
		// [67, 69, 72, 53, 60],
		[72, 74, 70, 53, 60]
	].choose;
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 20, // release
		level: 0.5, // main volume
		curve: -1 // concave or convex shape
	).kr;
	var midinotes = Drand(notes, inf).midicps;
	var trigger = Impulse.kr(rrand(1, 2));
	var snd = [LFTri, LFPulse, LFSaw].choose.ar(
		freq: Demand.kr(trigger, 0, midinotes) *
		[1, 1.001, 2, 3] * SinOsc.ar(1).range(0.9, 1.1) *
		XLine.kr(2, 1.4, 14),
		mul: 0.3
	);
	snd = LPF.ar(snd, SinOsc.ar(MouseX.kr(1, 12)).range(50, 4000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.9, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
