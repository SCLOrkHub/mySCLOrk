
SCLOrkChat.new("sam");




// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)


// ++ code copied from nicole
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(releaseTime:4.0, level: amp).kr(doneAction: 2);
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

// ++ code copied from bruno
(
Pbindef(\a,
	\instrument, "harpsichord1",
	\dur, 1/4,
	\degree, Pseq([-5, 1, 5, 14]*(1), inf),
	\amp, 0.1
).play(~clock, quant: 1)
)
// -- end of copied code