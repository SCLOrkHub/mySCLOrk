SCLOrkChat.new("tanya")

// ++ code copied from bruno

SCLOrkClock.startSync;
// -- end of copied code

// ++ code copied from bruno
(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\wow).quant = 4;
Pbindef(\wow,
	\dur, 1/2,
	\degree, Pseq([3, 1/3, 0, 1, 2], inf) * 9,
	\amp, 0.4,
	\legato, 0.5
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\wow).stop;
Pbindef(\eew,
	\dur, 1/4, // 1/4
	\midinote, [60, 61, 62] * 2,
	\amp, 0.4,
	\legato, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\new,
	\dur, 1/16,
	\midinote, [58, 60, 62] * 1/2,
	\amp, 0.4 * Pwhite(0, 1),
	\legato, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code



// ++ code copied from bruno
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, 0.25, 0.75);
	snd = snd * env;
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)
// -- end of copied code


// beginning of a blackbear song
// ++ code copied from bruno
(
Pbindef(\h,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\degree, Pseq([3, 0, 1, 2], inf) * 1/2,
	\amp, 0.4,
	\legato, 0.2
).play(~clock, quant: 4)
)
// -- end of copied code

(
Pbindef(\h,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\degree, Pseq([3, 0, 1, 2], inf) * 1/18,
	\amp, 0.4,
	\legato, 0.2
).play(~clock, quant: 4)
)


// new!
// ++ code copied from bruno
(
Pbindef(\hey,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\degree, Pseq([3, 2, 0, 7], inf) * 3,
	\amp, 0.4,
).play(~clock, quant: 4)
)
// -- end of copied code



// ++ code copied from bruno
(
// Pbindef(\h).stop;
Pbindef(\ih,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, 0,
	\amp, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code


// ++ code copied from bruno
(
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 1,
	\midinote, [52, 33, 54], // [39, 42, 45]
	\amp, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 1/2,
	\midinote, [39, 42, 45] + Pwhite(1, 2),
	\amp, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 1/10,
	\midinote, 36 + Prand([0, 2], inf) + [0, 24, 26, 30] * 1/22,
	\amp, Pwhite(0.3, 0.4)
).play(~clock, quant: 4)
)
// -- end of copied code




// ++ code copied from NATHAN
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(0.001, 0.3, level: amp).ar(doneAction: 2);
	snd = SinOsc.ar(60 * (1 + (Env.perc(0, 0.05).ar * 16)));
	snd = snd + (BPF.ar(WhiteNoise.ar, 3000, 0.3) * Env.p
		erc(0.001, 0.03).ar);
	snd = snd + Latch.ar(snd, Impulse.ar(ExpRand(100, 8000)));
	snd = snd * env;
	snd = (snd * 3).fold2;
	snd = (snd * 16).tanh;
	snd = LPF.ar(snd, 8000); // <- adjust for filter cutoff
	OffsetOut.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)
// -- end of copied code



// ++ code copied from NATHAN
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(0.001, 0.3, level: amp).ar(doneAction: 2);
	snd = Pulse.ar(120 * (1 + (Env.perc(0, 0.05).ar * 16)));
	snd = snd + (BPF.ar(PinkNoise.ar, 3000, 0.3) * Env.perc(0.001, 0.03).ar);
	snd = snd + Latch.ar(snd, Impulse.ar(ExpRand(100, 8000)));
	snd = snd * env;
	snd = (snd * 3).fold2;
	snd = (snd * 16).tanh;
	snd = (snd * 3).fold2;
	snd = LPF.ar(snd, 1000); // <- adjust for filter cutoff
	// drop from 8000 slowly in 50s to 25!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	OffsetOut.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)
// -- end of copied code


// ++ code copied from bruno
(
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 1/2,
	\midinote, [39, 22, 45] * Pwhite(1, 24) * 2,
	\amp, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code


/*
don't leak your clocks
sad but relieved
*/