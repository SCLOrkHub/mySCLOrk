// TECHNIQUES TO TRY:
SCLOrkChat("Harrison").new
// SinOsc can be replaced with LFTri, LFSaw, Saw, Pulse, LFPulse, etc -- to get a different TIMBRE.

// BUT.... same oscillators can be used anywhere else (freq or mul) to *control* the main oscillator.

// The important thing is to define good values for .range !!!!!

// for amplitude (mul), keep it between 0.0 and 1.0 (or less)

// for harmonic, anything between 1-32 or less

// for direct freq control, anything audible (20 to 20000 or less)

// the freq of the controller is the speed of the 'effect'


// choose your fadeTime (you can change this anytime):
Ndef(\a).fadeTime = 1;


// Example 1: SinOsc controlling mul:
(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 7;
	snd = SinOsc.ar(
		freq: SinOsc.ar(1). range(60, 72).midicps.round(100),
		mul: SinOsc.ar(2).range(0.0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

// Example 2: SinOsc controlling harmonic #
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = SinOsc.ar(1/5).range(3, 13).round(1);
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4
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
	snd = SinOsc.ar(
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


// Example 9: The joys of LFNoise: LFNoise0 picks random numbers and jumps to them directly. LFNoise1 does almost the same, but interpolates linearly between numbers. LFNoise2 interpolates logarithmically. They can be plugged pretty much anywhere.

(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(7).range(2, 19).round(1); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
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
