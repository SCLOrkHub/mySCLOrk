// total strings and bass sounds for group project
Ndef(\wowAmp, { DC.kr(1) });


(
Ndef(\bass).fadeTime = 1;
Ndef(\bass, {
	SinOsc.ar(
		freq: 40,
		mul: SinOsc.ar(1).range(0, 1)
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
		freq: harmonic * 20 * 2,
		mul: 0.1

	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	snd = Limiter.ar(Mix.ar(snd)) * Lag.kr(Ndef.kr(\wowAmp), 1);
}).play;
)

(
Ndef(\superWeirdAmp, { DC.kr(0.6) });
Ndef(\superweirdidek, {
	var snd, harmonic, vibratoSpeed, numHarm;
	harmonic = [1, 1.001, 0.99, 2, 2.01, 4, 8, 5];
	vibratoSpeed = [1, 1.1, 1.2, 1.5, 1.12, 0.9] * 10;
	numHarm = LFNoise0.ar(1/5).range(2, 10);

	harmonic = harmonic * SinOsc.ar(vibratoSpeed).range(0.99, 1.01);
	snd = Blip.ar(
		freq: harmonic * 20 * 2,
		numharm: numHarm,
		mul: LFNoise2.ar(1/[5, 2.1, 5.4, 2, 1, 0.4].scramble).range(0.01, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd)) * Lag.kr(Ndef.kr(\superWeirdAmp), 1);
}).play;
)




// darker strings!!!

(
Ndef(\wow).fadeTime = 8;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99, 2, 4, 8];
	harmonic = harmonic * SinOsc.ar([1, 1.1, 1.2, 1.5, 1.12, 0.9]).range(0.99, 1.01);
	snd = Saw.ar(
		freq: harmonic * 20 * 2,
		mul: SinOsc.ar(1/[5, 2.1, 5.4, 2, 1].scramble).range(0.1, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd)) * Lag.kr(Ndef.kr(\wowAmp), 1);
}).play;
)

(
Ndef(\wow).fadeTime = 8;
Ndef(\wow, {
	var snd, harmonic, vibratoSpeed;
	harmonic = [1, 1.001, 0.99, 2, 2.01, 4, 8] * MouseX.kr(1, 2);
	vibratoSpeed = [1, 1.1, 1.2, 1.5, 1.12, 0.9] * 10; // the 10 changes speed

	harmonic = harmonic * SinOsc.ar(vibratoSpeed).range(0.8, 1.2);
	snd = Saw.ar(
		freq: harmonic * 20 * 2,
		mul: LFNoise2.ar(1/[5, 2.1, 5.4, 2, 1, 0.4].scramble).range(0.01, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd)) * Lag.kr(Ndef.kr(\wowAmp), 1);
}).play;
)

(
Ndef(\wow).fadeTime = 8;
Ndef(\wow, {
	var snd, harmonic, vibratoSpeed;
	harmonic = [1, 1.001, 0.99, 2, 2.01, 4, 8, 5];
	vibratoSpeed = [1, 1.1, 1.2, 1.5, 1.12, 0.9] * 10;

	harmonic = harmonic * SinOsc.ar(vibratoSpeed).range(0.99, 1.01);
	snd = Saw.ar(
		freq: harmonic * 20 * 2,
		mul: LFNoise2.ar(1/[5, 2.1, 5.4, 2, 1, 0.4].scramble).range(0.01, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd)) * Lag.kr(Ndef.kr(\wowAmp), 1);
}).play;
)

(
Ndef(\superWeirdAmp, { DC.kr(0.4) });
Ndef(\wowAmp, { DC.kr(0.7) });
)
