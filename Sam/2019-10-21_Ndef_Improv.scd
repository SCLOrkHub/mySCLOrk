

(
Ndef(\wow).fadeTime = 5;
Ndef(\wow, {
	var snd, env;
	snd = Saw.ar(
		// freq: 43 * 12,
		freq: Line.kr(30, 43, [2, 1, 3].choose) * [7*8, 9*8, 10*8, 8*8].choose + [0, -2, -1, 3, 1],
		// freq: 43 * [1, 1.5, 3, 9] + [0, 1, 3],
		// width: 0.9, // for Pulse only
		mul: [LFSaw, LFPulse].choose.kr(XLine.kr([34, 15, 20].choose, 1, 3)).range(0.01, 1)
	);
	// snd = snd * LFTri.ar([1, 2].cholike 5%ose) * 0.8;
	env = Env.perc(attackTime: 0.01, releaseTime: 3.0, level: 1, -2).kr;
	snd = snd * env ;
	snd = LPF.ar(snd, LinLin.kr(env, 0, 1, 3000, 1000));
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: [0.5, 0.9],
		decaytime: 4
	);
	snd = Mix.ar(snd).distort.distort;
	snd = Limiter.ar(snd);
}).play;
)


(
Ndef(\wow).fadeTime = 2;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		// freq: 100,
		// freq: 100 + [0, 1, 3, -2, -10],
		freq: 100 * [1, 1.5, 3, 9] + [0, 1, 3],
		width: 0.9,
		mul: 1
	);
	snd = BPF.ar(
		in: snd,
		freq: LFPulse.ar(LFNoise0.ar(2).range(10, 19)).range(14550, 17500),
		rq: 0.1
	);
	snd = snd.distort.distort.distort;
	snd = snd * LFPulse.ar(
		freq: LFNoise0.ar(1/2).range(4, 7).round(1)
	).range(0, 1);
	Mix.ar(snd) / 5;
	Limiter.ar(snd);
}).play;
)



(
Ndef(\bo).fadeTime = 0;
Ndef(\bo, {
	var snd;
	snd = Saw.ar(
		freq: 40 + [0, 1/2, 1.2, 2] * [1, 2, 5],
		mul: LFPulse.ar(freq: Line.kr(4, 1/10, 30), width: 0.0135).range(0, 1)
	);
	snd = Mix.ar(snd) * 0.2;
	snd = snd.distort.distort.distort;
	/*snd = BPF.ar(
		in:  snd,
		freq: Rand(100, 555),
		rq: 0.9,
		mul: 1
	);*/
	snd = Limiter.ar(snd);
}).play;
)



Ndef.gui

(
Ndef(\wow).fadeTime = 2;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		// freq: 105,
		// freq: 100 + [0, 1, 3, -2, -10],
		freq: 105 * [1, 1.5, 3] + [0, 1, 1/2, 3],
		width: [0.1, 0.3],
		mul: 1
	);
	snd = BPF.ar(
		in: snd,
		freq: SinOsc.ar(1/15).range(150, 500),
		rq: 0.1
	);
	snd = snd.distort.distort.distort;

	Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.5, 0.7);
	Limiter.ar(snd);
}).play;
)

// ++ code copied from josh
Stethoscope.new;
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 43 * 3;

	snd = SinOsc.ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
