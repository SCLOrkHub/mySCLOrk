SCLOrkChat.new("josh");


// ++ code copied from bruno
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = LFPar.ar(
		freq: 43 * 19 * [1.05, SinOsc.ar(5).range(1, 2)], // choose harmonic from 1 to 32
		mul: LFNoise1.ar(20).range(0, 0.5) // volume
	);
	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh);
	snd = snd * 1000;
	snd = snd.tanh;
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


Stethoscope.new;

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var env = Env.perc(
		attackTime: 0.01, // attack
		releaseTime: 5, // release
		level: 0.4, // main volume
		curve: -4 // concave or convex shape
	).kr;
	var midinotes = Dseq([67, 69, 65, 53, 60]-24, inf).midicps;
	var trigger = Impulse.kr(4);
	var snd = LFSaw.ar(
		freq: Demand.kr(trigger, 0, midinotes),
		mul: 0.5
	);
	snd = 5 * snd * env;
	snd = FreeVerb.ar(snd, 0.5, 0.7);
    snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh) * 10;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
