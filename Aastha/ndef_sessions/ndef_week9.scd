SCLOrkChat.new("aastha");













// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = (43-12) * rrand(3, 20) * [1, 1.002, 2] * MouseX.kr(1,2);

	snd = LFPulse.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(6.1).range(1, 8)).range(0.1, 0.5) * MouseY.kr(1,2)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// don't change this version
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

(
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
)(
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



// ++ code copied from bruno
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	Pulse.ar(
		freq: 40 * [1, 1.001, 0.99] * MouseX.kr(1, 3),
		mul: LFPulse.ar(2).range(0, 1)
	)
}).play;
)
// -- end of copied code


// ++ code copied from tanya
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 29 * [1, 2, 3],
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
	freq = 40 * rrand(10, 20) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
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
	freq = 20 * rrand(10, 20) * [1, 1.002, 2] * MouseX.kr(1, 3);

	snd = SinOsc.ar(
		freq: freq * Saw.ar(1),
		mul: LFPulse.ar(LFPulse.ar(1.8).range(5, 7)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


// ++ code copied from samiam
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 40 * rrand(10, 20) * [1, 1.002, 2, 1.999, 0.999];

	snd = Saw.ar(
		freq: freq * SinOsc.ar(1/5, 0, 1, 0),
		mul: Pulse.ar(LFPulse.ar(2.5).range(7, 9)).range(0.1, 0.5)
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


// ++ code copied from josh
(
Ndef(\a, {
	var snd = LFTri.ar(
		freq: 43 * [LFNoise0.ar(5).range(1, 16).round(1), LFNoise0.ar(7).range(1, 16).round(1)],
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

// change this:
(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.25)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3.2).range(15, 20000),
		mul: 0.3
	);
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)



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
