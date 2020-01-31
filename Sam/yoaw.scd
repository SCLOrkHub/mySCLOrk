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
	\degree, Pseq([3, 3, 0, 0, 1, 1, 2, 2] * (-2) , inf),
	\rel, 0.01
).play(~clock, quant: 1).quant = 0;
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

// TIP 4: the first "quant" value you see only controls the moment the pattern will first enter (when you first start it). The second "quant" value controls when a modification will take effect if you change a value in real time and re-evaluate the pattern

// ++ code copied from tanya
(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, Prand([0, 0.5], inf),
	\degree, Pseq([5, 0, 1, 4, 2, 3, 4, 5, 6b, 1, 0, 4, 3, 2, 5, 1], inf),
	\rel, 0.25
).play(~clock, quant: 4).quant = 0;
)

Pbindef(\melody1).stop;
// -- end of copied code

// ++ code copied from bruno
(
SynthDef("verySimple", {arg freq=600, amp=0.1, att = 0.01, rel = 2.0, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(2, gate);
    snd = Pulse.ar(freq: freq, mul: env);
    snd = LPF.ar(snd, XLine.kr(10000, 700, att*8));
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
    \amp, Pseq([
        0, \rest, 0, // 1
        \rest, 0, \rest, // 2
        \rest, 0, // 3
        0, 0, // 4
        1, \rest, 0, // 1
        \rest, 0, \rest, // 2
        \rest, 0, // 3
        0, 0 // 4
    ], inf) * 0.2,
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
).play(~clock, quant: 8).quant = 8;
)
// -- end of copied code


