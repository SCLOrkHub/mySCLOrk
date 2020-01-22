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
		freq: 43 * harmonic * Line.kr(1, 0.9, 0.3),
		mul: Env.perc(
		attackTime: 0.02,
		releaseTime: 0.6,
		level: 1.0
		).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play
)

Ndef(\wow).fadeTime = 1; // choose fade time here for Ndef(\wow)



// try also changing SinOsc to Saw, LFSaw, Pulse, or LFTr

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var harmonic, snd;
	harmonic = 2; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(1, 0.5, 1),
		mul: Env.perc(
			attackTime:0.01,
			releaseTime: 1,
			level: 1.0,
			curve: 1
		).kr;
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
// -- end of copied code



// ++ code copied from nicole
(
Ndef(\wow, {
	var harmonic, snd;
	harmonic = 9; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(1, 0.9, 0.3),
		mul: Env.perc(
		attackTime: 0.02,
		releaseTime: 0.6,
		level: 1.0
		).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play
)
// -- end of copied code
