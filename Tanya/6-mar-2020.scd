
// bass
// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 85 * [1, 2, 3],
		mul: LFPulse.ar(1/8).range(0, 1)
	)
}).play;
)
// -- end of copied code






// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 31 * rrand(10, 20) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(34.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
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
		freq: SinOsc.ar(1/3).range(1000, 9000),
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



// rocks, crickets, idk wtf josh
// ++ code copied from josh
(
Ndef(\a, {
	var snd = LFTri.ar(
		freq: 43 * [LFNoise0.ar(15).range(1, 16).round(1), LFNoise0.ar(7).range(1, 16).round(1)],
		mul: Slew.ar(Saw.ar(13), 1000, 1000);
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
	var snd = WhiteNoise.ar(9);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(15000, 20000), // try 1000, 90000
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
		freq: LFPulse.ar(4 ).range(10000, 20000),
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
