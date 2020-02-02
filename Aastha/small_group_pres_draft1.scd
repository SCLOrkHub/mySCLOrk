// dream sequence sound from noonan first

// strings and more optimistic sounds to begin with

// include peoples voices saying something super strange and we play that on loop a billion times, this slowly distorts to something unimaginable

// pink floid on the run is a similar idea to this

// theme: dream sequence turned into sleep deprivation

// slowly transition that to mic crumpling paper with this sound below:


// children's laughter, parents saying "goodnight"

// dream sequence sound:


(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = Saw.ar(
		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/5).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)