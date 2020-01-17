SCLOrkChat.new("noonan");

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: (60.midicps)*SinOsc.ar(256).range(0.25, 4) + MouseX.kr(200, 2000),
		mul: 0.1
	);
	/*snd = LPF.ar(
		in: snd,
		freq: MouseX.kr(200, 1000),
		mul: 2
	);*/
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code


// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32*7+4,
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
	snd = Saw.ar(
		freq: 32 * rrand(1, 6) + [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
		mul: Env.perc(releaseTime: 3).kr
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)


// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Pulse.ar(
		freq: 32 * [8 + SinOsc.ar(1).range(-40, 40), 7 + SinOsc.ar(1).range(-20, 20), 6 + SinOsc.ar(1).range(-10, 10), 5 + SinOsc.ar(1).range(-5, 5), 4 + SinOsc.ar(1).range(-2.5, 2.5), 1 + SinOsc.ar(1).range(-1.25, 1.25)],
		mul: LFPulse.ar(10).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd1, snd2, snd;
	snd1 = Saw.ar(
		freq: [1, 1.001, 0.99] * 43, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/20).range(0.01, 0.5)
	);

	snd2 = SinOsc.ar(
		freq: [1, 1.001, 0.99] * 43, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/20).range(0.3, 0.5)
	);

	snd = snd1*0.85 + snd2*0.15;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\wow).clear(60);
// -- end of copied code
