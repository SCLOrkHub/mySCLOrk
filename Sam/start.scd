
SCLOrkChat.new("sam");




// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 5 + [0, 5, 2, 3, 3.5, 1.5, 6];

	snd = Saw.ar(
		freq: [freq, freq * 1.001, freq + 1],
		mul: SinOsc.ar(1).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef(\thing, {
	var env, snd, freq, preamp;
	freq = 43 * [2, 2.001, 1, 1.001, 0.999, 0.998, 0.997, 1.003, 1.999];
	preamp = 16;
	env = MouseX.kr(0, (preamp * pi));
	snd = SinOsc.ar(freq: freq, mul: env);
	snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd))) * 0.1;
	}).play;
)

// -- end of copied code

// ++ code copied from jia
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.999];
	snd = LFSaw.ar(
		freq: harmonic * [[10, 5, 3, 4, 6, 2], (1.001+[10, 5, 3, 4, 6, 2]) * Line.kr(300, 1, 20.5),
		mul: Saw.ar(7).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd)).distort;
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.5, 2];

	snd = Saw.ar(
		freq: freq * Line.kr(1, 10, 20),
		mul: LFSaw.ar(2).range(0, 0.4)
	);

	snd = LPF.ar(snd, LFNoise0.ar(8).range(100, 8500));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
