SCLOrkChat.new("bbb");

// control + b to boot sound server

// control + enter


// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 4;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFSaw.ar(1/10).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



{ SinOsc.ar(300) }.plot
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.5, 2];

	snd = Saw.ar(
		freq: freq * Line.kr(2, 30, 60),
		mul: LFSaw.ar(10).range(0, 0.4)
	);

	snd = LPF.ar(snd, LFNoise0.ar(8).range(100, 8500));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)





// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 4;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFSaw.ar(1/10).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from jia
(
Ndef(\noMidTerm2).fadeTime = 1;
Ndef(\noMidTerm2, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.999];
	snd = LFSaw.ar(
		freq: harmonic  * 5  * Line.kr(150, 1, 10.5) * [1, 1.5, 3.2],
		mul: LFTri.ar(1/10).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd)).distort;
}).play;
)
// -- end of copied code
