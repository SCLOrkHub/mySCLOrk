

// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)

// -- end of copied code

// ++ code copied from bruno
(
SynthDef("square1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(releaseTime: 1, level: amp, curve: -24).kr(doneAction: 2);
	snd = VarSaw.ar(freq * [1, 0.999, 1.0001], 0, LFNoise1.ar([0.7, 0.9, 1.1]).range(0.2, 0.8), 0.75);
	snd = (snd * 30 * env);
	snd = (snd - (snd.pow(3)/6) + (snd.pow(5)/120) - (snd.pow(7)/5040));
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

// ++ code copied from bruno
(
Pbindef(\x).quant = 4;
Pbindef(\x,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\ctranspose, Pstutter(8, Pwhite(-8, 4)),
	\degree, Pseq([-2, 0, 0, -2, 1, 1, 1, 1], inf),
	\amp, Pseq([1, 1, 0, 1, 1, 0, 0, 0], inf),
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\x,
	\instrument, "harpsichord1",
	\dur, 2,
	\degree, Pseq([-5, 3, 2, 5], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code
Pbindef(\a).stop;


(
Pbindef(\i,
	\instrument, "square1",
	\dur, Pseq([Pn(1/8, 24), Pn(1/4, 11)], inf),
	\amp, Pseq([Pxrand([0, 0.01, 0.1 ], 24), 0.6], inf),
	\degree, Pseq([
		Pseq([-2, -2, -2, Pxrand([-2, 0, 1, 2, 4, 5], 3)], 24),
		Pseq([-3, -1, 1, 2, -3, -1, 1, 2, 1, -1, -3])], inf),
	\ctranspose, -12,
).play(~clock, quant: 4);
)