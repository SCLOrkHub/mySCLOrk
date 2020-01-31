SCLOrkChat.new("Herbie_Hancock");
(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4], inf),
	\dur, Pwhite(1, 4)
).play;
)


(
Pbindef(\name,
	// \instrument, "bagpipe",
	\degree, Pseq([0, 1, 2, 3, 4], inf),
	\ctranspose, -12,
	\dur, Pwhite(1, 4),
	\amp, 0.2
).play
)

Pbindef(\name).stop

// ++ code copied from sam
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
	\dur, 1/8,
	\amp, 0.5,
	\degree, Pseq([2, 2, 0, 7, 1, 1, 3, 3] , inf),
	\rel, 0.25
).play(~clock, quant: 1).quant = 0;
)

Pbindef(\melody1).stop;


(
Pbindef(\melody2,
	\instrument, "harpsy",
	\dur, 1/8,
	//Pseq([1, 0.5, 0.5, 1, 0.5, 0.5, 1], inf),
	\amp, Prand([0, 0, 0.5], inf),
	\degree, Pseq([5, 4, 3, 5, 4, 7], inf),
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody2).stop;

(
Pbindef(\melody3,
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.15,
	\degree, Pseq([3, 0, 1, 2], inf) + 2,
	\rel, 0.5
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody3).stop;

(
Pbindef(\faster,
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, 0.15,
	\degree, Pseq([Prand([3, 5]), 0, 1, 2], inf) + 2, // << quickie way to transpose pitch, just add a number
	\rel, 0.5
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster).stop;

(
Pbindef(\faster2,
	\instrument, "harpsy",
	\dur, Pseq([0.5, 0.25, 0.25], inf),
	\amp, 0.05,
	\degree, Pseq([Prand([5, 7]), 0, 1, 2], inf),
	\mtranspose, 14, // << "official" way to transpose the whole pattern up or down
	\rel, 1
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster2).stop;

(
Pbindef(\pachs,
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, 0.15,
	\midinote, Pseq([60, 72, 55, 48], inf),
	\mtranspose, -7,
	\rel, 3
).play(~clock, quant: 1).quant = 0;
)

Pbindef(\pachs, \amp, 0.05); // you can change just the one parameter, without resetting all the others
Pbindef(\pachs, \rel, 5);


// TIP 1: if all goes well, you never will need to hit control period.
// You are able to stop individual patterns directly with the .stop command.
// If you get lost and just need to stop everything, it's OK to hit control + period though.

// TIP 2: when playing in group, focus on playing ONE pattern only, otherwise it can get too crowded

// TIP 3: whenever you alter a number and re-run a Pbindef of same name, it will seamlessly replace the previous values with new values.
// You can copy paste and have many copies of one same Pbindef (say, "melody1"), and create variations around it. No matter which copy you run, if it is called "melody1", it's the same entity that you are changing.

// TIP 4: the first "quant" value you see only controls the moment the pattern will first enter (when you first start it). The second "quant" value controls when a modification will take effect if you change a value in real time and re-evaluate the pattern.
// -- end of copied code


(
SynthDef("verySimple", {arg freq=440, amp=0.1, att = 0.01, rel = 0.01, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(2, gate);
    snd = Saw.ar(freq: freq, mul: env);
    snd = LPF.ar(snd, XLine.kr(12000, 700, att*8));
    Out.ar(0, [snd, snd]);
}).add;
)


(
Pbindef(\hancock,
    \instrument, "verySimple",
    \dur, Pseq([
        0.25, Rest(0.5), 0.25, // beat 1
        Rest(0.5), 0.25, Rest(0.25), // beat 2
        Rest(0.5), 0.5, // beat 3
        0.5, 0.5 // beat 4
    ], inf),
    \midinote, Pseq([
        34, \rest, 44, // 1
        \rest, 46, \rest, // 2
        \rest, 36, // 3
        37, 38, // 4
        39, \rest, 46, // 1
        \rest, 49, \rest, // 2
        \rest, 31, // 3
        32, 33 // 4
    ], inf),
	\ctranspose, 0,
    \amp, Pseq([
        1, \rest, 1, // 1
        \rest, 1, \rest, // 2
        \rest, 1, // 3
        1, 1, // 4
        1, \rest, 1, // 1
        \rest, 1, \rest, // 2
        \rest, 1, // 3
        1, 1 // 4
    ], inf) * 0.2,
    \att, 0.02,
    \rel, 0.1,
    \legato, 0.7,
).play(~clock, quant: 8).quant = 8;
)

(
Pbindef(\hancock2,
    \instrument, "verySimple",
    \dur, 8,
	\midinote, Pseq([ [80, 85]
    ], inf),
	\ctranspose, 12,
	\amp, SinOsc(10).range(0, 0.5),
    \att, 0.02,
    \rel, 0.1,
    \legato, 0.7,
).play(~clock, quant: 8).quant = 8;
)




// Experiment: each SCLOrk player plays only one note of the bass line
// All the amps below are now 0 (silence). Pick only one of them, change to 1.
// (if players are in a circle, go around the circle in order)
(
Pbindef(\hancock2,
    \instrument, "verySimple",
    \dur, Pseq([
        0.25, Rest(0.5), 0.25, // beat 1
        Rest(0.5), 0.25, Rest(0.25), // beat 2
        Rest(0.5), 0.5, // beat 3
        0.5, 0.5 // beat 4
    ], inf),
    \midinote, Pseq([34, \rest, 44, \rest, 46, \rest, \rest, 36, 37, 38, 39, \rest, 46, \rest, 49, \rest, \rest, 31, 32, 33], inf),
    \amp, Pseq([0, \rest, 0, \rest, 0, \rest, \rest, 0, 0, 0, 0, \rest, 0, \rest, 0, \rest, \rest, 0, 0, 0], inf) * 0.2,
    \att, 0.02,
    \rel, 0.1,
    \legato, 0.7,
).play(~clock, quant: 4).quant = 8;
)




// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * SinOsc.ar(5).round(1).range(20, 30) + SinOsc.ar(1).range(-5, 5);

	snd = LFTri.ar(
		freq: freq,
		mul: Saw.ar(MouseX.kr(1, 20)).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// ++ code copied from jia
(
Ndef(\noMidTerm).fadeTime = 1;
Ndef(\noMidTerm, {
	var snd, harmonic;
	harmonic = [43, 1.001, 0.999];
	snd = LFSaw.ar(
		freq: harmonic * 1 * Line.kr(350, 5, 20.5) * Line.kr(5, 350, 20.5),
		mul: LFTri.ar(1/10).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd)).distort;
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.5, 2];

	snd = Saw.ar(
		freq: freq * Line.kr(1, 10, 10),
		mul: LFSaw.ar(2).range(0, 0.4)
	);

	snd = LPF.ar(snd, LFNoise0.ar(8).range(100, 8500));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\noMidTerm).fadeTime = 4;
Ndef(\noMidTerm, {
	var snd, freq;
	freq = 43 * rrand(1, 4) + [0, 1];

	snd = Saw.ar(
		freq: freq,
		mul: LFSaw.ar(1).range(0, 0.4)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\b).fadeTime = 2;
Ndef(\b, {
	arg env, snd, freq, amp, rel;
	freq = [22, 69, 65, 75, 74].choose.midicps * [1, 1.001, 0.999, 1.5, 5, 6.7] * Line.kr(1, 1.15, rrand(4, 7));
	amp = 0.4;
	rel = 10;
	env = Env.perc(releaseTime: rel).ar;
	env = env * SinOsc.ar(1/3).range(0.1, 1);
	// env = LFTri.ar(1/4).range(0.5, 1) * LFPulse.ar(rrand(4, 15));
	snd = Pulse.ar(freq * SinOsc.ar(1/6).range(0.9975, 1.025));
	snd = RLPF.ar(snd, SinOsc.ar(1).range(1000, 14000), 0.4);
	snd = Decimator.ar(snd, rrand(10000, 3333), SinOsc.ar(1/3).range(4, 10));
	snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: Line.kr(1, 0.5, 4),
		pitchDispersion: 0.1
	);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.01,
		decaytime: 10
	);
	snd = Mix.ar(snd * env * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code
