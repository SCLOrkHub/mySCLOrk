(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0, width = 0.25;
    var env, snd;
	env = Env.perc(level: amp).kr(doneAction: 2);
	snd = VarSaw.ar(freq, 0, SinOsc.ar(8).range(0, 1), 0.75);
	snd = snd * env;
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;

SynthDef("bd", { arg out = 0, freq = 440, amp = 0.1, pan = 0, width = 0.25;
    var env, snd;
	env = Env.perc.ar(doneAction: 2);
	snd = SinOsc.ar(env * 100).tanh;
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;

SynthDef("bd", { arg out = 0, freq = 440, amp = 0.1, pan = 0, width = 0.25;
    var env, snd;
	env = Env.perc(0.001, 0.5, 1, -8).ar(doneAction: 2);
	snd =  LFPulse.ar(7300).range(0, 1) * LFPulse.ar(4670).range(0, 1) * LFPulse.ar(5870).range(0, 1) * LFPulse.ar(15890).range(0, 1) * env * amp;
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)


// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\d,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\degree, Pseq([0, 1, 2, 1, -1], inf)+14,
	\amp, 0.4,
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\boo).stop;
Pbindef(\d,
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
	\dur, 3/4,
	\midinote, Prand([63, 65, 67, 68], inf)+12,
	\amp, 0.4
).play(~clock, quant: 4)
)

(
Pbindef(\boo).stop;
Pbindef(\boo,
	\instrument, "bd",
	\dur, 1/20,
	\amp, Pseq([1, Prand([1, 0], 4)], inf)
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from NATHAN
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(0.001, 0.3, level: amp).ar(doneAction: 2);
	snd = SinOsc.ar(120 * (1 + (Env.perc(0, 0.05).ar * 16)));
	snd = snd + (BPF.ar(WhiteNoise.ar, 3000, 0.3) * Env.perc(0.001, 0.03).ar);
	snd = snd + Latch.ar(snd, Impulse.ar(ExpRand(100, 8000)));
	snd = snd * env;
	snd = (snd * 3).fold2;
	snd = (snd * 16).tanh;
	snd = (snd * 3).fold2;
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
