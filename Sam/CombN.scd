


(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 43 * rrand(12, 14) * [1, 1.01],
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: 0.4,
			level: 0.9
		).kr()
	);
	snd = CombN.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: rrand(0.05, 0.25),
		decaytime: 10
	);
	snd = snd.distort;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)


// ++ code copied from luken
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: [43, 42.99, 43.01] * rrand(2, 6),
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: 5,
			level: 0.4
		).kr(doneAction: 2)
	);
	snd = CombN.ar(snd, 1.0, MouseX.kr, MouseY.kr);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
