// ==================================
// Sync *without* SCLOrkClock
//
// This file assumes you have already start a TempoClock simultaneously with other players over the network
// (see file TempoClock Demo PLAYER, or CONDUCTOR if you will be the conductor of your small group)
//
// ==================================


// ==============================
// 1. LOAD SYNTHDEF(s)
// Load a couple SynthDefs (you can always add more later)
// Make sure to boot server before adding these SynthDefs!
(
SynthDef("harpsy", { arg out = 0, freq = 440, amp = 0.1, pan = 0, rel = 3;
    var env, snd;
	env = Env.perc(releaseTime: rel, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, SinOsc.ar(MouseY.kr(1, 5)).range(0.25, 0.5));
	snd = snd * env;
	snd = Mix.ar(snd);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)


// ================================
// 2. PLAY!
// Play your patterns on the ~clock that has been created from the other file

(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2], inf),
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody1).stop;


(
Pbindef(\melody2,
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.15,
	\degree, Pseq([3, 0, 1, 0], inf) - 7,
	\rel, 1
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody2).stop;

(
Pbindef(\melody3,
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, 0.15,
	\degree, Prand([3, 0, 1, 2], inf) + Prand([1, 2, 3], inf),
	\rel, 4
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody3).stop;

(
Pbindef(\faster,
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, 0.15,
	\degree, Pseq([Prand([3, 5]), 0, 1, 2], inf) + 2, // << quickie way to transpose pitch, just add a number
	\mtranspose, 7,
	\rel, 1
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster).stop;

(
Pbindef(\faster2,
	\instrument, "harpsy",
	\dur, Pseq([0.5, 0.25, 0.25], inf),
	\amp, 0.15,
	\degree, Pseq([Prand([5, 7]), 0, 1, 2], inf),
	\mtranspose, 7, // << "official" way to transpose the whole pattern up or down
	\rel, 3
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster2).stop;

(
Pbindef(\pachs,
	\instrument, "harpsy",
	\dur, 1/2,
	\amp, 0.15,
	\degree, Pseq([3, 0, 1, -2, -1b, -4, -1b, 0], inf),
	\mtranspose, 14,
	\rel, 3,
	\strum, 0.1
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\pachs, \amp, 0.05); // you can change just the one parameter, without resetting all the others
Pbindef(\pachs, \rel, 7);


// TIP 1: if all goes well, you never will need to hit control period.
// You are able to stop individual patterns directly with the .stop command.
// If you get lost and just need to stop everything, it's OK to hit control + period though.

// TIP 2: when playing in group, focus on playing ONE pattern only, otherwise it can get too crowded

// TIP 3: whenever you alter a number and re-run a Pbindef of same name, it will seamlessly replace the previous values with new values.
// You can copy paste and have many copies of one same Pbindef (say, "melody1"), and create variations around it. No matter which copy you run, if it is called "melody1", it's the same entity that you are changing.

// TIP 4: the first "quant" value you see only controls the moment the pattern will first enter (when you first start it). The second "quant" value controls when a modification will take effect if you change a value in real time and re-evaluate the pattern.

// ++ code copied from aastha
(
Ndef(\pulsingbeatbutweird).fadeTime = 0;
Ndef(\pulsingbeatbutweird, {
	var harmonic, snd, dur;
	dur = 4;
	harmonic = [0.999, 1, 1.091]; // change this number, anything between 1 to 32.
	snd = Saw.ar(
		freq: 43 * harmonic * [Line.kr(start: 1, end: 0.5, dur: dur)] * MouseX.kr(1.5, 30),
		//mul: Env.triangle(dur: dur, level: 2).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		/*mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: 4
		).kr*/
		mul: Pulse.ar(1.5).range(dur, dur+5) * MouseY.kr(2, 20)//this makes it repeat

	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

(
Ndef(\pulsingbeatbutweird).fadeTime = 0;
Ndef(\pulsingbeatbutweird, {
	var harmonic, snd, dur;
	dur = 4;
	harmonic = [0.999, 1, 1.091]; // change this number, anything between 1 to 32.
	snd = Saw.ar(
		freq: 43 * harmonic * [Line.kr(start: 1, end: 0.5, dur: dur)],
		//mul: Env.triangle(dur: dur, level: 2).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		/*mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: 4
		).kr*/
		mul: Pulse.ar(1.5).range(dur, dur+5)//this makes it repeat
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;


// ++ ORIGINAL code copied from noonan
(
SynthDef("bClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq, 0.5);

	snd = LPF.ar(snd, Pulse.ar(1).range(100, 400));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)
(
SynthDef("cClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*2, 0.5);

	snd = LPF.ar(snd, Pulse.ar(2).range(100, 600));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)
(
Pbindef(\bClick,
	\instrument, "bClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;

Pbindef(\cClick,
	\instrument, "cClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;
)

(
SynthDef("dClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq, 4);

	snd = LPF.ar(snd, Pulse.ar(1).range(10, 300));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 1);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)

Pbindef(\dClick,
	\instrument, "dClick",
	\dur, 2,
	//\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, 7
).play(~clock, quant: 4).quant = 4;


// ++ code copied from aastha
(
SynthDef("instrument", { arg freq, gate = 1;
	var snd, harmonic, env;
	harmonic = [5, 5.001, 4.99];
	snd = Saw.ar(
		freq * 3 * 2,
	);
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);
	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;
)
(
Pbindef(\testwow,
	\instrument, "instrument",
	\dur, 1,
	\amp, 0.4,
	\degree, Pseq([0, -3, 0, -3], inf),
).play(~clock, quant: 4).quant = 4;
)

// ++ code copied from aastha
(
SynthDef("beat", { arg freq, gate = 1;

	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = SinOsc.ar( //can change
		freq: harmonic * 10 * Line.kr(0.5, 0, 5.5),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	//snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);


	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

Pbindef(\testwow,
	\instrument, "beat",
	\dur, 1,
	\amp, 0.4,
	\degree, Pseq([1, 0, 0, 0], inf),
).play(~clock, quant: 4).quant = 4;
)

// ++ code copied from aastha
(
SynthDef("testwow", { arg freq, gate = 1;
	/*var snd, harmonic, env;
	harmonic = [4, 4.001, 4.99];
	snd = Saw.ar(
		freq * harmonic * 0.44 * 2,
	);
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);*/

	/*var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = Pulse.ar(
		freq: harmonic * Pulse.ar(1/5).range(0.1, 0.8) * [1, 2, 6], // < let's finish on the tonic, 1 or 2 harmonic
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, 1300).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);*/
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = SinOsc.ar( //can change
		freq: harmonic * 10 * Line.kr(0.5, 0, 5.5),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	//snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);
	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

Pbindef(\testwow,
	\instrument, "testwow",
	\dur, 1/2,
	\amp, 0.4,
	\degree, Pseq([0, 0, 0, 0], inf),
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code
