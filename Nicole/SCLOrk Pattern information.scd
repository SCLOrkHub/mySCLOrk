SCLOrkChat.new("nicole")

SCLOrkChat.new("nicole"

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

// ++ code copied from Zach

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

(
Pbindef(\name,
		// \instrument, "nikki j".
		\degree, -35,
		\dur, 0.5,
		\amp, 0.7
).play
)

Pbindef(\name).stop


(	h
Pbindef(\name2,
		// \instrument, "nikki j".
			// \scale, Scale.harmonicMinor, Zamzam, Zanjaran, Zhi, Yakah, Yu, etc.
			\degree, Pwhite ([10, -10]),
			// \mtranspose [0,3] --builds instant chords
			\dur, Pseq([0.5, 0.8, 2, 3]),
		\amp, 0.7
).play
)