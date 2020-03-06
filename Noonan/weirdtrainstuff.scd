(
// move mouse
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 1, // attack
		releaseTime: 60, // release
		level: 0.4, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var midinotes = [
		(Dseq([10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85], inf)).midicps,
		// Dseq([67,69,67,69,65,67, 69, 65, 53, 60,60,67,69,], inf).midicps,
		// Dseq([69,67,69,67,69,65,67, 69, 65, 53, 60,60,67,], inf).midicps
	];
	var trigger = Impulse.kr(37);
	var snd = LFSaw.ar(
		freq: Demand.kr(trigger, 0, midinotes.choose) * SinOsc.ar(7) * [
			1, 1.01, 2, 2.001, 3, 3.001, 4, 4.01, 5, 5.05, 6, 6.05, 7, 7.1, 8, 9, 10
		],
		mul: LFSaw.ar(3).range(0.1, 0.8)*SinOsc.ar(1/10).range(0, 1),
	);
	snd = LPF.ar(snd, SinOsc.ar(67).range(100, 20000));
	snd = snd * env;
	snd = FreeVerb.ar(snd, 1, 1, 1, 2);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)