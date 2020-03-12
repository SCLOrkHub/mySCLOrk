

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	LFSaw.ar(
		freq: 40 * 5,
		mul: LFSaw.ar(1.5).range(0, 1)
	)
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 40 * rrand(10, 20) * [1, 1.002, 2];

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
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
	freq = 40 * rrand(5, 25) * [1, 1.001, 0.999];

	snd = LFSaw.ar(
		freq: freq * MouseX.kr(0.1, 1),
		mul: LFSaw.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd).distort.distort.distort;
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef(\a, {
	var snd = LFTri.ar(
		freq: 43 * [LFNoise0.ar(4).range(1, 16).round(1), LFNoise0.ar(10).range(1, 16).round(1)],
		mul: Slew.ar(Saw.ar(3), 1000, 1000);
	);
	snd = LPF.ar(snd, MouseX.kr(150, 9600));
	snd = snd * Slew.ar(LFPulse.ar(6, 0, 0.15), 10000, 10000);
	snd = Mix.ar(snd);
	snd = CombC.ar(snd, 0.1, 0.1, 3);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh);
	snd = SinOsc.ar(0, (snd  * MouseY.kr(0.1, 16) * pi).mod(2pi));
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var snd = WhiteNoise.ar(2);
	var env = LFPulse.ar(
		freq: 8,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(1000, 9900),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from edmond
(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: [5.49, 6.51],
		width: SinOsc.ar(1/3).range(0.1, 0.25)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3.14).range(66,66600),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.21, 0.95);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: LFPulse.ar(4).range(10000, 90000),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: LFPulse.ar(4).range(10000, 20000),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
