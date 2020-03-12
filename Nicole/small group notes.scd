//START: Nicole 1

(
Ndef(\a, {
    var snd = LFSaw.ar(
        freq: 43,
        mul: LFSaw.ar(4/1).range(0, 1)
    );
    snd = LPF.ar(in: snd, freq: LFPulse.ar(2).range(100, 1000));
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)

//slowly get to 50

//henry adds in the low bass vibe

(
Ndef(\a, {
    var harmonic, snd;
    harmonic = LFTri.ar(3).range(3, 13).round(1);
    snd = SinOsc.ar(
        freq: 13 * harmonic,
        mul: LFPulse.ar(4).range(0.1, 0.3)
    );
    snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)


//add in Nicole 2
(
Ndef(\a).fadeTime = 2;
Ndef(\a, {
    var snd = LFSaw.ar(
        freq: XLine.kr(100, 2, rrand(1, 4)) * [2, 2.01, 3, 5, 7],
        mul: LFSaw.ar(8).range(0, 1) * Line.kr(4)
    );
    snd = LPF.ar(in: snd, freq: SinOsc.ar(2).range(-5500, 6000));
    snd = snd * LFPulse.ar(freq: 1, width: 0.4);
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)

//Enter Sophia 1
(
Ndef(\a).fadeTime = 5;
Ndef(\a, {
        var env = Env.perc(
        attackTime: 0.01, // attack
        releaseTime: 15, // release
        level: 0.9, // main volume
        curve: -6 // concave or convex shape
        ).kr;
    var snd = LFPulse.ar(
        freq: 90 * [1, 11, 23, 96, 19],
        mul: LFSaw.ar(4).range(0, 1)
    );
    snd = LPF.ar(in: snd, freq: SinOsc.ar(12).range(500, 800));
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)


//fucked up sophia 1

(
Ndef(\a).fadeTime = 5;
Ndef(\a, {
        var env = Env.perc(
        attackTime: 0.01, // attack
        releaseTime: 15, // release
        level: 0.9, // main volume
        curve: -12 // concave or convex shape
        ).kr;
    var snd = LFPulse.ar(
        freq: 10 * [1, 11, 23, 96, -19],
        mul: LFSaw.ar(4).range(0, 1)
    );
    snd = LPF.ar(in: snd, freq: SinOsc.ar(12).range(500, 800));
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)