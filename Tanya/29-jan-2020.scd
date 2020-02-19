SCLOrkChat.new("tan");


// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq, env;
	freq = 43 * 12 + [0, 1, 2, 3, 5];

	env = Env.linen(attackTime: 0.01, releaseTime: 0.9, level: 2);
	snd = LFSaw.ar(
		freq: freq,
		// mul: LFPulse.ar(1/15).range(0, 0.1)
		mul: env
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 120;
	amp = 0.1;
	rel = 5;
	// env = Env.sine(dur: 5, level: 2).ar(doneAction: 2);
	env = Env.perc(releaseTime: rel, level: 3).ar(doneAction: 2);
	snd = LFTri.ar(freq * LFPulse.ar(1/12).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)


(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 120;
	amp = 0.3;
	rel = 7;
	env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = LFTri.ar(freq * LFPulse.ar(1/12).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 3);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)


// ++ code copied from josh
(
Ndef(\thing, {
	var env, snd, freq, preamp;
	freq = 43;
	preamp = 16;
	env = MouseX.kr(0, (preamp * pi));
	snd = SinOsc.ar(freq: freq, mul: env);
	snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd))) * 0.1;
	}).play;
)

// -- end of copied code


// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 3 * 1 * [1, 1.5, 2];

	snd = LFTri.ar(
		freq: freq * Line.kr(1, 40, 20),
		mul: LFPulse.ar(10).range(0, 0.4)
	);

	snd = LPF.ar(snd, LFNoise0.ar(8).range(100, 8500));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\b).fadeTime = 2;
Ndef(\b, {
	arg env, snd, freq, amp, rel;
	freq = [22, 69, 65, 75, 74].choose.midicps * [1, 1.001, 0.999, 1.5, 5, 6.7] * Line.kr(1, 1.15, rrand(4, 7));
	amp = 0.4;
	rel = 10;
	env = Env.perc(releaseTime: rel).ar;
	env = env * SinOsc.ar(1/3).range(0.1, 1);
	// env = LFTri.ar(1/4).range(0.5, 1) * LFPulse.ar(rrand(4, 15));
	snd = Pulse.ar(freq * SinOsc.ar(1/6).range(0.9975, 1.025));
	snd = RLPF.ar(snd, SinOsc.ar(1).range(1000, 14000), 0.4);
	snd = Decimator.ar(snd, rrand(10000, 3333), SinOsc.ar(1/3).range(4, 10));
	snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: Line.kr(1, 0.5, 4),
		pitchDispersion: 0.1
	);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.01,
		decaytime: 10
	);
	snd = Mix.ar(snd * env * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code





// ++ code copied from bruno
// ===================================
// Frequency Modulation example
// (make sure you have a working ~clock running)
// ===================================

(
SynthDef("FM-env", {arg freq = 440, cmRatio = 3, modIndex = 0, amp = 0.01, att = 0.01, dec = 0.05, sus = 0.9, rel = 0.1, pan = 0, gate = 1;
	var carrier, modulator, modFreq, freqDev, snd, env;
	env = Env.adsr(
		attackTime: att,
		decayTime: dec,
		sustainLevel: sus,
		releaseTime: rel,
		peakLevel: amp
	).kr(gate: gate);

	// modIndex always ramps down to 1 over attack duration
	modIndex = Line.kr(modIndex, 1, att*2);

	modFreq = freq * cmRatio.reciprocal;
	freqDev = modIndex * modFreq;

	modulator = SinOsc.ar(freq: modFreq, mul: freqDev);
	carrier = SinOsc.ar(freq: freq + modulator);
	snd = carrier * env;
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)

(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf) * 1/16,
	\mtranspose, 12, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, -13, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(9, 15), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.4, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code

// ++ code copied from BigZ

(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 120, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 120, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(0, 100), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.5, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code

// ++ code copied from sam
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([1, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 0, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 0.5, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(10, 1000), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 1.0,
	\dec, Pkey(\dur) * 3, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 2.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code



// ++ code copied from bruno
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 2, 4, 6, 8], inf),
	\mtranspose, -7, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 2, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, 1, Pwhite(3, 5), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, 0.1, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code
