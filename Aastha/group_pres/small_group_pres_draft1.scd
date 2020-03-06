// dream sequence sound from noonan first

// strings and more optimistic sounds to begin with

// include peoples voices saying something super strange and we play that on loop a billion times, this slowly distorts to something unimaginable

// pink floid on the run is a similar idea to this

// theme: dream sequence turned into sleep deprivation

// slowly transition that to mic crumpling paper with this sound below:


// children's laughter, parents saying "goodnight"

// dream sequence sound:

// bass sound
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 40, //* MouseX.kr(0.5, 2),
		mul: SinOsc.ar(1).range(0, 1) //* Pulse.ar(4) * MouseX.kr(1, 12)
	)
}).play;

)

//strings
(
Ndef(\wow).fadeTime = 8;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = ([1, 1.001, 0.99, 2, 4, 8] + 20)* SinOsc.ar(1).range(0.99, 1.01);
	snd = Saw.ar(
		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: 0.1//SinOsc.ar([1/5, 1/2, 1/5, 1/2, 5]).range(0.1, 0.5)*[0.1, 1, 1, 0.8, 0.4,0.9]

	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)



//darker strings - mosquito glissando, could be more randomized
(
Ndef(\wow).fadeTime = 8;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99, 2, 4, 8] * SinOsc.ar(1).range(0.99, 1.01);
	snd = Saw.ar(
		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar([1/5, 1/2, 1/5, 1/2, 5]).range(0.1, 0.5)*[0.1, 1, 1, 0.8, 0.4, 0.9]
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

(
Pbindef(\werkit,
	\instrument, "werkit",
	\amp, Pwhite(0.05, 0.1),
	\note, Pseq([-2, -4, 2, 4].mirror, inf),
	\ctranspose, -12,
	\dur, 2,
	\rel, 2,
	\rq, Pwhite(0.005, 0.01)
).play;
);