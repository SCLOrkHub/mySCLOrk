SCLOrkChat.new("nicole");


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
// ++ code copied from bbb
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd;
	snd = SinOsc.ar(
		freq: 440,
		mul: 0.2
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bbb
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd;
	snd = Pulse   .ar(
		freq: 64.midicps,
		mul: 0.5
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bbb
Ndef(\test).clear(5)
// -- end of copied code
