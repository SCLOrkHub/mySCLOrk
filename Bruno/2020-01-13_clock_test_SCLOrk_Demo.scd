
SCLOrkChat.new("bruno", true);

// creating folder where to save your stuff:

// open terminal
// type following commands.

// cd Music

// git clone https://github.com/SCLOrkHub/mySCLOrk.git




SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)

(
Pbindef(\ha).quant = 0;
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 3,
	\freq2, 977 * [1, 1.5],
	\midinote, 24 + Prand([0, 7], inf) + [0, 24, 26, 30, 37],
	\amp, Pwhite(0.1, 0.4)
).play(~clock, quant: 0)
)


(
Pbindef(\ha,
	\instrument, "harpsichord1",
	\dur, 1/8,
	\degree, Pseq([3, 0, 1, 2], inf) + Prand([0, 1], inf) + 7,
	\amp, 0.4 //* Pwhite(0, 1),
).play(~clock, quant: 4)
)


Pbindef(\i).clear(5);
(
Pbindef(\h).stop; // stop whatever else you have going on
Pbindef(\i,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, 0,
	\amp, 0.4
).play(~clock, quant: 4)
)


(
Pbindef(\wow).quant = 4;
Pbindef(\wow,
	\dur, 1/4,
	\degree, Pseq([3, 0, 1, 2], inf) - 12,
	\amp, 0.4,
	\legato, 0.2
).play(~clock, quant: 4)
)


(
Pbindef(\new,
	\dur, 1/8,
	\midinote, 48,
	\amp, 0.4 * Pwhite(0, 1),
	\legato, 0.1
).play(~clock, quant: 4)
)




(
Pbindef(\h,
	\instrument, "harpsichord1",
	\dur, Pseq([1/4, 1/8, 1/8], inf),
	\degree, Pseq([3, 0, 1, 2], inf) + Prand([0, 2, 7], inf),
	\amp, 0.4 * Pwhite(0, 1),
).play(~clock, quant: 4)
)





// ++ code copied from bruno
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(releaseTime: 0.25, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq * [1, 0.999, 1.0001], 0.25, 0.75);
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

// ++ code copied from NATHAN
(
SynthDef("harpsichord1", { arg out = 0, freq2 = 60, amp = 0.1, pan = 0;
    var env, snd, env2;
	env2 = Env.triangle(10).kr(2);
	env = Env.perc(0.1, 5.9, level: amp).ar;
	snd = SinOsc.ar(freq2 * (1 + (Env.perc(0, 0.05).ar * 16)));
	// snd = snd + (BPF.ar(WhiteNoise.ar, 300, 0.3) * Env.perc(0.001, 0.03).ar);
	snd = snd + Latch.ar(snd, Impulse.ar(ExpRand(10, 80)));
	snd = snd * env;
	snd = (snd * 3).fold2;
	snd = (snd * 16).tanh;
	snd = LFPulse.ar(1/4) * snd;
	snd = FreeVerb.ar(snd, 0.5, 0.8);
	snd = LPF.ar(snd, Line.kr(17000, 1000, 1/4)); // <- adjust for filter cutoff
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
