(
SynthDef("verySimple", {arg freq=440, amp=0.1, att = 1, rel = 1, gate=1;
    var snd, env;
    env = Env.asr(attackTime: att, sustainLevel: 3, releaseTime: rel).ar(2, gate);
	snd = SinOsc.ar(freq: [freq * SinOsc.ar(0.1, pi).range(0.95, 1.05), freq * SinOsc.ar(0.1).range(0.95, 1.05)], mul: env);
	snd = snd * pi * 5;
	snd = SinOsc.ar(0, snd.mod(2pi));
	//snd = RLPF.ar(snd, LinExp.ar(env, 0, 2.5, 16000, 1000), 0.7);
	snd = snd * amp;
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
        1, \rest, 0, // 1
        \rest, 0, \rest, // 2
        \rest, 1, // 3
        1, 1, // 4
        1, \rest, 0, // 1
        \rest, 0, \rest, // 2
        \rest, 1, // 3
        1, 1 // 4
    ], inf) * 0.2,
    \att, 0.1,
    \rel, 0.1,
    \legato, 0.7,
).play(~clock, quant: 8).quant = 8;
)


SCLOrkChat.new("josh");


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