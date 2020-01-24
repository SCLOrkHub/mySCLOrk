
SCLOrkChat.new("nicole")

// ++ code copied from bruno
(
Ndef(\test)

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 15 * -3.5;
	snd = Pulse.ar(
		freq: freq,
		mul: Env.triangle(dur: 30).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


(
Ndef(\wow, {
	var harmonic, snd;
	harmonic = 1; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(-1, 0.9, 0.3),
		mul: Env.perc(
		attackTime: 0.02,
		releaseTime: 6,
		level: 1.0
		).kr // an automatic up and down in volume (triangle shape)
	);
		snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play
)


// ++ code copied from aastha
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	var harmonic = [50, 51, 49] * -3;
	freq = harmonic * Pulse.ar(1/3).range(0.5, 0.8);

	snd = LFPulse.ar(
		freq: freq,
		//mul: Env.triangle(dur: 40).kr; // stops automatically after 30 seconds
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code




// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 23 * rrand(-2, 7);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(4).range(0.01, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(0, 500));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from bruno
// -- end of copied code



// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
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
Pbindef(\x).quant = 4;
Pbindef(\x,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, Pseq([-5, 1, 2, 10], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\a,
	\instrument, "harpsichord1",
	\dur, 1,
	\degree, Pseq([-5, 1, 2, -10], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code
