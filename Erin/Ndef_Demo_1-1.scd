(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 7; // change this number, anything between 1 to 32, then control + enter
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4 // you can also change the volume here
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

// you do not need to use control period -- simply change the number as you like, then run control+enter right again, the sound will update immediately.

// if you don't like the abruptness of the sound change, you can specify crossfade times:

Ndef(\a).fadeTime = 2; // run this, then go back to the block of code above and do more changes.


// another variation:
(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 17; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: Env.triangle(dur: 15, level: 0.4).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
})
)


// you can have more than one Ndef simultaneously, just give it a different name:
(
Ndef(\wow, {
	var harmonic, snd;
	harmonic = 9; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: Env.triangle(dur: 15, level: 0.4).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play
)

Ndef(\wow).fadeTime = 1; // choose fade time here for Ndef(\wow)



// try also changing SinOsc to Saw, LFSaw, Pulse, or LFTri



// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5), 1000, 100)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [5, 5.0001, 5];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(2.1).range(2.1, 4.1)).range(0.5, 0.9), 1000, 100)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var snd = LFSaw.ar(
		freq: 43 * [0.5, 0.51, 0.52, 0.53],
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from Lucas
(
Ndef( \bargaining, {
	var snd, freq;
	freq = 47 * [2, 5, 8, 1] * SinOsc.ar(MouseY.kr(2/3, 20)).range(0.001, 0.21);
	snd = SinOsc.ar(freq);
	snd = BMoog.ar(snd * pi*MouseX.kr(0.5, 50), LFSaw.ar(5).range(20, 20000));
	snd = Limiter.ar(Mix.ar(snd));
}).play
)

// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 40,
		mul: LFSaw.ar(1).range(0, 1)
	)
}).play;
)
// -- end of copied code
