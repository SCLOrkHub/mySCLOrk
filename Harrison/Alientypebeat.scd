

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
	snd = LPF.ar(snd, LFSaw.ar(MouseX.kr(1, 12)).range(200, 2000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.6, 0.4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
