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
    var env, snd, snd2;
	env = Env.perc(releaseTime: rel, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, SinOsc.ar(MouseY.kr(1, 5)).range(0.25, 0.5));
	snd2 = SinOsc.ar(freq);
	snd = snd+snd2;
	snd = snd * env;
	snd = LPF.ar(snd, 800, 6);
	snd = FreeVerb.ar(snd, 0.9, 0.9, 0.9, 2);
	snd = snd.clip;
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

SCLOrkChat.new("noonan");
// ================================
// 2. PLAY!
// Play your patterns on the ~clock that has been created from the other file

(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2], inf),
	\rel, 0.25,
	\mtranspose, [0, 2]
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody1).stop;


(
Pbindef(\melody2,
	\instrument, "harpsy",
	\dur, Pwrand([0.125, 0.0625, 0.25, 0.5], [0.7, 0.1, 0.1, 0.1], inf),
	\amp, Prand([0, 0, 0.5], inf),
	\ctranspose, Prand([-24, -12, 0, 12, 24], inf),
	\degree, Prand([0, 2b, 0, 4, 0, 7, 0, 6, 0, 4, 0, 3, 0, 2b, 1, 1b], inf),
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody2).stop;

(
Pbindef(\melody3,
	\instrument, "harpsy",
	\dur, 0.5,
	\amp, 0.15,
	\degree, Pseq([5, 7, 6, 8, 5, 3, 8], inf),
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
(
Pbindef(\faster,
	\instrument, "harpsy",
	\dur, Pseq([0.5, 0.25, 0.25], inf)*2,
	\amp, 0.05,
	\degree, Pseq([[0, 2, 4], [0, 2, 5], [0, 3, 5], [1, 3, 5]], inf),
	\ctranspose, [-36, -24], // << "official" way to transpose the whole pattern up or down
	\rel, 2,
	\strum, 0.3
).play(~clock, quant: 4).quant = 4;

Pbindef(\faster2,
	\instrument, "harpsy",
	\dur, Pseq([0.5, 0.25, 0.25], inf),
	\amp, 0.05,
	\degree, Pseq([[0, 2, 4], [0, 2, 5], [0, 3, 5], [1, 3, 5]], inf),
	\mtranspose, 7, // << "official" way to transpose the whole pattern up or down
	\rel, 2,
	\strum, 0.6
).play(~clock, quant: 4).quant = 4;
)

(
Pbindef(\faster).stop;
Pbindef(\faster2).stop;
)

(
Pbindef(\pachs,
	\instrument, "harpsy",
	\dur, 2,
	\amp, 0.15,
	\degree, Pseq([0, -3, -2, -5, -4, -7, -4, -3], inf),
	\ctranspose, 2,
	\rel, 3
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\pachs, \amp, 0.05); // you can change just the one parameter, without resetting all the others
Pbindef(\pachs, \rel, 5);

Pbindef(\pachMelody,
	\instrument, "harpsy",
	\midinote, Pseq([62, 66, 69, 67, 66, 62, 66, 64, 62, 59, 62


// TIP 1: if all goes well, you never will need to hit control period.
// You are able to stop individual patterns directly with the .stop command.
// If you get lost and just need to stop everything, it's OK to hit control + period though.

// TIP 2: when playing in group, focus on playing ONE pattern only, otherwise it can get too crowded

// TIP 3: whenever you alter a number and re-run a Pbindef of same name, it will seamlessly replace the previous values with new values.
// You can copy paste and have many copies of one same Pbindef (say, "melody1"), and create variations around it. No matter which copy you run, if it is called "melody1", it's the same entity that you are changing.

// TIP 4: the first "quant" value you see only controls the moment the pattern will first enter (when you first start it). The second "quant" value controls when a modification will take effect if you change a value in real time and re-evaluate the pattern.