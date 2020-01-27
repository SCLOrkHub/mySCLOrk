SCLOrkChat.new("aastha");


// ++ code copied from tanya
(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1/8,
	\amp, Prand([0, 0, 0.5], inf),
	\degree, Pseq([6, 3, 2, 4], inf),
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody1).stop;
// -- end of copied code


// ++ code copied from bruno
(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1/8,
	\amp, Prand([0, 0, 0, 0, 0.5], inf),
	\degree, Pwhite(0, 5),
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code



// ++ code copied from bruno
(
SynthDef("verySimple", {arg freq=440, amp=0.1, att = 0.01, rel = 0.01, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(2, gate);
    snd = Pulse.ar(freq: freq, mul: env);
    snd = LPF.ar(snd, XLine.kr(10000, 700, att*8));
	snd = snd.distort.distort.distort;
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
        \rest, 1, // 3
        0, 0, // 4
        0, \rest, 0, // 1
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
).play(~clock, quant: 4).quant = 8;
)
// -- end of copied code
