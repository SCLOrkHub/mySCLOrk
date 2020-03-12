SCLOrkChat.new("nikki_j")

// ++ code copied from bruno
(
SynthDef("verySimple", {arg freq=440, amp=0.1, att = 0.01, rel = 0.01, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(2, gate);
    snd = LFSaw.ar(freq: freq, mul: env);
    snd = LPF.ar(snd, XLine.kr(10000, 700, att*8));
    Out.ar(0, [snd, snd]);
}).add;
)

------------------------------------------------------------------------------------

(
SynthDef("verySimple", {arg freq=440, amp=0.1, att = 0.01, rel = 0.01, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: amp, releaseTime: rel).kr(2, gate);
    snd = LFSaw.ar(freq: freq, mul: env);
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
        1, 0, // 4
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
).play(~clock, quant: 4).quant = 8;
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
    \amp, Pseq([1, \rest, 1, \rest, 1, \rest, \rest, 1, 1, 1, 1, \rest, 1, \rest, 1, \rest, \rest, 1, 1, 1], inf) * 0.2,
    \att, 0.02,
    \rel, 0.1,
    \legato, 0.7,
).play(~clock, quant: 4).quant = 8;
)
// -- end of copied code
