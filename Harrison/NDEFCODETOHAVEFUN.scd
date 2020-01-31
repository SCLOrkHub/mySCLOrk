SCLOrkChat("Harrison").new

(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 7;
	snd = SinOsc.ar(
		freq: SinOsc.ar(1). range(60, 72).midicps.round(100),
		mul: SinOsc.ar(99).range(0.0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)


// Example 3: one LFPulse controlling harmonic, another controlling mul
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = LFPulse.ar(3).range(3, 13).round(1);
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: LFPulse.ar(2).range(0.1, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

// Example 4: Line.ar(start, end, dur)
// Line does its job once, then stays at end value
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = Line.ar(20, 5, 5).round(1);
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

// Example 5: MouseX.kr and MouseY.ar
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = MouseX.kr(1, 16).round(1);
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: MouseY.kr(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// Example 6: Mouse control of amp (mul) modulation
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = 6;
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: SinOsc.ar(MouseX.kr(1, 44)).range(0.0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// Example 7: adding more "voices" inside one same Ndef using square brackets
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = [6, 6.1, 9]; // three partials at same time
	snd = Pulse.ar(
		freq: 43 * harmonic,
		mul: 0.3
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// Example 8: combining two tricks to control beatings with mouse movement
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = 10; // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * harmonic + [0, MouseX.kr(0, 4)],
		mul: 0.3
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

)

// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise1.kr(10).range(7, 20).round(1); // two harmonics at same time
	snd = Saw.ar(
		freq: 40 * harmonic,
		mul: Pulse.ar(MouseX.kr(1, 40)).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


// ++ code copied from bruno
(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise2.kr(1/9).range(12, 36).round(1); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 10 * harmonic,
		mul: LFPulse.ar(MouseX.kr(1, 40)).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code






// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq, harmonic;
	harmonic = Sin.kr(1/26).range(5, 10).round(1);
	freq = 43 * harmonic;

	snd = SinOsc.ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 43 * 3;

	snd = .ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq, harmonic;
	harmonic = SinOsc.kr(2).range(5, 6).round(1);
	freq = 10 * harmonic;

	snd = Pulse.ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq, harmonic;
	harmonic = SinOsc.kr(2).range(5, 6).round(1);
	freq = 10 * harmonic;

	snd = Pulse.ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * 3;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from aastha
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	var harmonic = [50, 51, 49] * 3;
	freq = harmonic * Pulse.ar(1/6).range(0.1, 0.8);

	snd = LFPulse.ar(
		freq: freq,
		//mul: Env.triangle(dur: 25).kr; // stops automatically after 20 seconds
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
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

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
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
