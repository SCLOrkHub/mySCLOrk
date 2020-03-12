{SinOsc.ar()}.play;
SCLOrkChat.new("tanya2");
Quarks.update("SCLOrkTools");

// ++ code copied from luken

(
SCLOrkClock.startSync;
~clock = SCLOrkClock.new;
)
// -- end of copied code

// ++ code copied from bruno

// CLOCK (do only once)
(
SCLOrkClock.startSync;
~clock = SCLOrkClock.new;
)

// SynthDef (run once, or every time you change something)
(
SynthDef("pmCrotales", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr(doneAction: 2);
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	Out.ar(out, snd);
}).add;
)


// Pbindef improv here
(
Pbindef( \pmCrotales,
	\instrument, "pmCrotales",
	\ctranspose, 0,
	\dur, Pseq([2, 1, 1/2], inf),
	\amp, 0.5,
	\degree, Pseq([
		0, 2, 6, -9, -1, 1
	], inf),
	\att, 0.001,
	\rel, 3,
	\modLo, 5,
	\modHi, 6
).play(argclock: ~clock, quant: 1);
)

// -- end of copied code

// my version: dhol
(
Pbindef( \pmCrotales,
	\instrument, "pmCrotales",
	\ctranspose, -21,
	\dur, Pseq([2, 1, 1/2], inf) * 1/5,
	\amp, 0.35,
	\degree, Pseq([
		0, 2, 6, -9, -1, 1
	], inf),
	\att, 0.03,
	\rel, 3,
	\modLo, 5,
	\modHi, 6
).play(argclock: ~clock, quant: 1);
)

// my version: ?
(
Pbindef( \pmCrotales,
	\instrument, "pmCrotales",
	\ctranspose, -29,
	\dur, Pseq([2, 1, 1/2], inf) * 1/5,
	\amp, 0.35,
	\degree, Pseq([
		0, 2, 6, -9, -1, 1
	], inf),
	\att, 0.03,
	\rel, 3,
	\modLo, 5,
	\modHi, 6
).play(argclock: ~clock, quant: 1);
)



// ++ code copied from bruno

(
Pbind(
	\degree, Pseq([0, 1, 2, 3], inf),
	\dur, 0.5,
).play(argClock: ~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from luken
(
SCLOrkClockMonitor.new
)
// -- end of copied code

// mine!
(
SynthDef("newCroutons", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5, delay = 0.1;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr;
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	snd = CombN.ar(
		in:  [snd, snd],
		maxdelaytime:  0.5,
		delaytime: delay,
		decaytime: 0.3
	);

	DetectSilence.ar(in: snd, amp:  0.01, time: 1, doneAction: 2);
	snd = Mix.ar(snd);
	Out.ar(out, snd);
}).add;
)


//
// ++ code copied from bruno
// with CombN
// SynthDef (run once, or every time you change something)
(
SynthDef("newCroutons", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5, delay = 0.1;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr;
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	snd = CombN.ar(
		in:  [snd, snd],
		maxdelaytime:  0.5,
		delaytime: delay,
		decaytime: 0.3
	);

	DetectSilence.ar(in: snd, amp:  0.01, time: 1, doneAction: 2);
	snd = Mix.ar(snd);
	Out.ar(out, snd);
}).add;
)


// Pbindef improv here
(
Pbindef(\test,
	\instrument, "newCroutons",
	\ctranspose, Prand([0, -24], inf),
	\dur, Pseq([2, 1, 1/2], inf),
	\amp, 0.2,
	\degree, Pseq([
		0, 2, 6, -9, -1, 1
	], inf),
	\att, 0.1,
	\rel, 3,
	\modLo, 2,
	\modHi, 7,
	\delay, 0.2
).play();
)
// -- end of copied code




// ++ code copied from josh
(
SynthDef("badCrotales", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5;
	var env, snd, mod, trick;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr(doneAction: 2);
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * 0.75
	);
	trick = (snd.round(Env.pairs([[0, 0.001], [att + rel, 0.05]], \lin).ar) * 0.5) + snd.round(Env.pairs([[0, 0.01], [att + rel, 0.75]], \lin).ar) * amp;
	snd = HPF.ar(trick, (freq) * snd.range(1/3, 3));
	snd = [Mix.ar(snd), Mix.ar(snd)];
	Out.ar(out, snd);
}).add;
)

(
Pbindef(\test,
	\instrument, "badCrotales",
	\ctranspose, Prand([0, -24], inf),
	\dur, Pseq([2, 1, 1/2], inf),
	\amp, 0.2,
	\degree, Pseq([
		0, 2, 6, -9, -1, 1
	], inf),
	\att, 0.1,
	\rel, 3,
	\modLo, 2,
	\modHi, 7,
	\delay, 0.2
).play();
)
// -- end of copied code



// ++ code copied from bruno
(
SynthDef("betterCroutons", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5, delay = 0.1, decay = 10;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr;
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	snd = CombN.ar(
		in:  snd,
		maxdelaytime:  1,
		delaytime: delay,
		decaytime: decay
	);

	DetectSilence.ar(in: snd, amp:  0.01, time: 1, doneAction: 2);
	Out.ar(out, snd);
}).add;


// ?
Pbindef(\test2,
	\instrument, "betterCroutons",
	\ctranspose, 0,
	\dur, Pseq([2, 1, 1/2], inf) * 10,
	\amp, 0.2,
	\degree, Pseq([0, 7], inf),
	\att, 0.001,
	\rel, 5,
	\modLo, 5.4,
	\modHi, 5.45,
	\delay, 1,
	\decay, 5
).play();
)
// -- end of copied code


// GONGS !!!!!!!!!

(
SynthDef("betterCroutons", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5, delay = 0.1, decay = 10;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr;
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	snd = CombN.ar(
		in:  snd,
		maxdelaytime:  1,
		delaytime: delay,
		decaytime: decay
	);

	DetectSilence.ar(in: snd, amp:  0.01, time: 1, doneAction: 2);
	Out.ar(out, snd);
}).add;

// GONGS
Pbindef(\test2,
	\instrument, "betterCroutons",
	\ctranspose, 0,
	\dur, Pseq([2, 1, 1/2], inf) * 10,
	\amp, 0.2,
	\degree, Pseq([0, 7], inf),
	\att, 0.001,
	\rel, 5,
	\modLo, 1.4,
	\modHi, 1.45,
	\delay, 1,
	\decay, 5
).play();
)
// this was 6-8pm
// could present as symposium as part of sclork tools package!
// 8pm - 9pm


// NDEF
// phone ringing
// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	arg delay = 0.1, decay = 10;
	var snd;
	snd = SinOsc.ar(
		freq: 43 * [2, 4, 6, 8, 6, 4, 2] * 0.6,
		// freq: 43 * rrand(2, 6),
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: 1,
			level: 0.4
		).kr(doneAction: 2)
	);
	snd = CombN.ar(
		in:  snd,
		maxdelaytime:  1,
		delaytime: delay,
		decaytime: decay
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from luken
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: [43, 42.99, 43.01] * rrand(2, 6),
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: 5,
			level: 0.4
		).kr(doneAction: 2)
	);
	snd = CombN.ar(snd, 1.0, MouseX.kr, MouseY.kr);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 43 * rrand(12, 14) * [1, 1.01],
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: 0.4,
			level: 0.9
		).kr()
	);
	snd = CombN.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: rrand(0.05, 0.25),
		decaytime: 10
	);
	snd = snd.distort;
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\purr3, {
	var snd = Klank.ar(
		`[
			Array.fill(32, { | i | i + 1 }),
			nil,
			Array.fill(32, { 0.1 })
		],
		BPF.ar(
			Klang.ar(`[
			Array.fill(32, { | i | i + 1}),
			Array.fill(32, { | i | 1.0 / (i + 1.0)}),
			nil
		], freqscale: 43.3),
			44 * MouseX.kr(1, 32) * LFNoise2.kr([1, 2, 3]).range(0.9, 1.1),
			rq: MouseY.kr(0.1, 1.0),
			mul: SinOsc.ar(0.2).range(0.1, 0.5)),
		freqscale: 43);
	snd = Mix.ar(snd);
	snd = BPF.ar(snd, MouseY.kr(100, 888), MouseX.kr(0.1, 1.0));
	snd = FreeVerb.ar(snd);
	snd;
}).play;
)
// -- end of copied code






// ++ code copied from bruno
(
SynthDef(\subtract, { |freq, amp, dur, out|
var snd;
snd = WhiteNoise.ar(amp);
snd = BMoog.ar(snd, freq, 0.7, mode: 3);
snd = snd * EnvGen.kr(Env.perc(0.01, 2), doneAction: Done.freeSelf);
Out.ar(out, snd);
}).add;

Pbindef(\blurry,
\instrument, "subtract",
\scale, Scale.aeolian,
\degree, Pseq([0, Prand([1, 5, 4, 2]), 3, 2, 5, Prand([7, 2])], inf),
\root, 24,
\dur, 0.25,
\amp, 0.3
).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\frogz).fadeTime = 4; // big crossfade time
Ndef(\frogz, {
	var snd;
	var sample = [c, f]; // crickets sample
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  sample,
		rate: LFTri.kr(1/10).range(0.1, 0.2) * BufRateScale.kr(sample),
		startPos: 0,
		loop:  1
	);
	snd = snd * 0.5; //XLine.kr(0.01, 0.5, 20);
	snd = Mix.ar(snd); // make sure it's mono
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code




// ++ code copied from bruno
(
Ndef(\wow).clear(3);
Pbindef(\cool,
	\instrument, "grain-asr",
	\buffer, c,
	\startPos, 0.1, // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
	\dur, 1/10,
	\att, 0.001,
	\rel, Pwhite(0.01, 0.5),
	\rate, Pseq([1, 1.5, 0.5, -1.1, 1.2], inf) * 15 * 1/5,
	// a negative number for \rate makes sound goes backward
	\amp, 0.75,
	\legato, 1,
	\whichFilter, 1,
	\ffreq, Prand([1000, 2500, 3333, 4444, 10000], inf)
).play;
)
// -- end of copied code
