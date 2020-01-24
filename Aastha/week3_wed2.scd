

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(1, 7);

	snd = Saw.ar(
		freq: freq,
		mul: Env.triangle(dur: rrand(9, 15)).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


/*

PATTERNS

*/


// ++ code copied from bruno

SCLOrkClock.startSync;
(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\x,
	\dur, 1,
	\degree, Pseq([1, 4, 6, 14], inf),
	\amp, 0.1
).play(~clock, quant: 4) //enter on a beat that's multiple of 4 // all come in at same time
)
// -- end of copied code

// ++ code copied from aastha
(
Pbindef(\x,
	\dur, 1,
	\degree, Pseq([0, 1, 2, 3], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code



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

// ++ code copied from bruno
(
Pbindef(\x).quant = 0.5;
Pbindef(\x,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, Pseq([-5, 1, 2, 10], inf),
	\amp, 0.1
).play(~clock, quant: 3)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\a,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, Pseq([-5, 1, 2, 10], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code
