// ==========================
// SIMPLE BEAT SLICER DEMO
//
// Basic idea:
// - take one or more drum loops (same duration, same BPM)
// - slice and shuffle beats (or subdivision of beats) to generate new, composite drum beats
// ==========================



// Here I load 4 samples that *I know* are all drum loops at 162 BPM.
// (accepted formats: wav, aif, flac)
// NOTE the .resolveRelative trick: if you place the sound files in the same folder as this file is saved, you don't have to mess with changing file paths

c = Buffer.readChannel(s, "Clairvoyant162.wav".resolveRelative, channels: [0]);
d = Buffer.readChannel(s, "Conducted162.wav".resolveRelative, channels: [0]);
e = Buffer.readChannel(s, "Labello162.wav".resolveRelative, channels: [0]);
f = Buffer.readChannel(s, "Raw162.wav".resolveRelative, channels: [0]);

// This is the SynthDef that will take care of playing the samples
(
SynthDef.new("slicer", { arg bufnum, pointer = 1, amp = 0.5, gate = 1, rate = 1;
	var env, snd;
	env = Env.asr(
		attackTime: 0.001,
		sustainLevel: amp,
		releaseTime: 0.001
	).kr(doneAction: 2, gate: gate);
	// env = Env.perc(0.01, 0.5).kr(doneAction: 2, gate: gate);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: pointer * BufFrames.kr(bufnum);
		// pointer is a number between 0 and 1 (0=beginning of sample, 1=end of sample)
	);
	snd = snd * env;
	Out.ar(0, [snd, snd]);
}).add;
)


// Create a clock to run the Pbind with.
// NOTE: the clock should be set at same tempo as samples' BPM
~clock = TempoClock.new(162/60).permanent_(true);

// Just play all four samples in sequence, once, nothing fancy.
(
Pbindef(\test,
	\instrument, "slicer",
	\bufnum, Pseq([c, d, e, f], inf),
	\pointer, 0,
	\dur, 4, // each samples takes 4 beats at 162 bpm to play through once
	\rate, 1,
	\legato, 1,
	\amp, 0.3,
).play(~clock, quant: 4).quant = 4;
)


// Fun part begins here

// =================
// EXAMPLE 1
// =================

// Slicing one sample randomly (shuffling its beats around)
(
// Play with the number of subdivisions (1, 2, 4, 8, 16):
// =====================
var subdivision = 8;
// =====================
// Don't change the next three variables
var numberOfBeatsInSample = 4; // this is fixed according to the samples you are using
var pointerSequence = Array.series(subdivision+1).normalize.drop(-1).postln;
var sliceDuration = numberOfBeatsInSample / subdivision;

Pbindef(\test,
	\instrument, "slicer",
	\bufnum, e,
	\pointer, Prand(pointerSequence, inf),
	\dur, sliceDuration,
	\rate, 1,
	// \rate, Prand([1, 1, 0.5, 2], inf), // try this out
	\legato, 1,
	\amp, 0.3,
).play(~clock, quant: 4).quant = 4;
)


// =================
// EXAMPLE 2
// =================

// Like the above but slicing all four samples with a Prand
// Big differences if you use Prand or Pseq (try it)

(
// Play with the number of subdivisions (1, 2, 4, 8, 16):
// =====================
var subdivision = 8;
// =====================
// Don't change the next three variables
var numberOfBeatsInSample = 4; // this is fixed according to the samples you are using
var pointerSequence = Array.series(subdivision+1).normalize.drop(-1).postln;
var sliceDuration = numberOfBeatsInSample / subdivision;

Pbindef(\test,
	\instrument, "slicer",
	\bufnum, Prand([c, d, e, f], inf),
	\pointer, Pseq(pointerSequence, inf),
	\dur, sliceDuration,
	\rate, 1,
	// \rate, Prand([1, 1, 0.5, 2], inf), // try this out
	\legato, 1,
	\amp, 0.3,
).play(~clock, quant: 4).quant = 4;
)