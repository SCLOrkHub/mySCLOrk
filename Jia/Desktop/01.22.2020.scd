SCLOrkChat.new("jia");

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 43 * ;

	snd = SinOsc.ar(
		freq: freq,
		mul: Env.triangle(dur: 10).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\confusing, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise1.kr(1).range(-30, 30);//.round(-10); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * harmonic + [Line.kr(-200, 200, 5)],
		mul: LFSaw.ar(5).range(0.1, 0.5)
	);
	snd = FreeVerb.ar(snd, 0.5, 1.5, 1.5);
	snd = LPF.ar(snd, 1000).distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	harmonic = Pulse.ar(1).range(-10, 50).round(-30); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 5* harmonic + [Line.kr(-20, 300, 5)] + MouseX.kr(-30, 30),
		mul: LFSaw.ar(4).range(0.1, 0.5) //+ MouseX.kr(0.1, 30)
	);
	snd = FreeVerb.ar(snd, 0.5, 1.5, 2.5);
	snd = LPF.ar(snd, 1500);//.distort.distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * 3;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// ++ code copied from aastha
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	var harmonic = [50, 51, 49] * 4;
	freq = harmonic * LFSaw.ar(1/6).range(0.1, 0.8);

	snd = LFPulse.ar(
		freq: freq,
		//mul: Env.triangle(dur: 25).kr; // stops automatically after 20 seconds
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(1, 8);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise1.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * LFSaw.ar(2).range(2, 10).round(0.5) * [0.99, 1.001];

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1)+ MouseX.kr(0.1, 30);
	);
	snd = LPF.ar(snd, LFNoise1.ar(16).range(300, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

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


// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)

// ++ code copied from aastha
(
Pbindef(\x,
	\dur, 1,
	\degree, Pseq([0, 1, 2, 3], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)

// ++ code copied from aastha
(
Pbindef(\x,
	\dur, 1,
	\degree, Prand([10, 11, 12, 13], inf),
	\amp, 0.4
).play(~clock, quant: 4)
)

// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
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

// ++ code copied from nil
(
Pbindef(\a,
	\instrument, "harpsichord1",
	\dur, 1/2,
	\degree, Pseq([-8, 1, 2, 5], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from nicole
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code
