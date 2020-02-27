SCLOrkChat.new("aastha");


// ++ code copied from bruno
(
Ndef(\deepListening).fadeTime = 1;
Ndef(\deepListening, {
	var snd, freq;
	freq = (43+12) * [4.01, 4.99];

	snd = LFPulse.ar(
		freq: freq,
		mul: LFPulse.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code




// old version of code
(
Ndef(\deepListening).fadeTime = 1;
Ndef(\deepListening, {
	var snd, freq;
	freq = 43 * 4;

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;


// ++ code copied from Zach
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(2, 7);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from Zach
Ndef(\yuh).fadeTime = 0;
Ndef(\yuh, {
	var snd, freq;
	freq = 43 * SinOsc.ar(1).range(2, 10).round(1) * [1, 1.001];

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
// ++ code copied from Zach
Ndef(\yuh).fadeTime = 0;
Ndef(\yuh, {
	var snd, freq;
	freq = 43 * LFNoise0.ar(17).range(rrand(1, 5), 17).round(1.4) * [1, 1.01,1/2];

	snd = LFPulse.ar(
		freq: freq,
		mul: LFPulse.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 15000));
	snd = FreeVerb.ar(snd, 0.6);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from jiji
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd = [LFSaw, SinOsc, LFPulse].choose.ar(
		freq: 43 *
		XLine.ar(
			start: rrand(10, 15),
			end: 1,
			dur: [12, 13, 14].choose) *
		[1, 1.01, 1.5, 2.001],
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = LPF.ar(snd, 12000);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 1 * [1, 0.99, 1.001];

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


// PART 2 : NDEF 9 MINUTE BUILDING HARMONIC TEXTURE






// ++ code copied from bruno
( // cool vibration sounds
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 4 * [1, 1.00002];

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


// pulsey thing
// ++ code copied from bruno
(
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 9 * [1, 1.002];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



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
