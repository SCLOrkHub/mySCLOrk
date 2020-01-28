Quarks.update("SCLOrkTools");

SCLOrkChat.new("josh")

// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
SynthDef("harpsy", { arg out = 0, freq = 440, amp = 0.1, pan = 0, rel = 3;
    var env, snd;
	env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(MouseY.kr(0.01), [0, pi/2, pi, 3pi/2]).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1).distort.distort;
	snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 8, 16000), 0.8);
	snd = Mix.ar(snd * amp);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)
BufWr

// ================================
// 2. PLAY!
// Play your patterns on the ~clock that has been created from the other file

(
Pbindef(\melodyY, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2], inf),
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody2).stop;

// -- end of copied code

// ++ code copied from bruno
(
~clock = SCLOrkClock.new.permanent_(true);
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from luken
~clock = SCLOrkClock.new(\messup).permanent_(true);
// -- end of copied code

// ++ code copied from bruno
// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new.permanent_(true);
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code


(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, Pseq([2/5, 2/5, 1/5], inf),
	\amp, Prand([Pseq([0.5, 0.5, 0]), Pseq([0, 0.5, 0.5])], inf),
	\degree, Pseq([3, 5, 5, 0, 2, 2, 1, 3, 3, 4, 2, 2], inf),
	\rel, 0.5,
	\ctranspose, [-12, -24]
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code

// ++ code copied from bruno
// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new.permanent_(true);
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code


(
Pbindef(\melody2, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1/8,
	\amp, Pseq([0, 1, 1, 1], inf),
	\degree, Pseq([2, 0, 3, 0, 4], inf),
	\rel, 0.15
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code



// ++ code copied from bruno
(
Pbindef(\melodyX, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 2/5,
	\amp, Pseq([1, Prand([0, 0.5], 4)], inf),
	\degree, Pstutter(10, Pseq([
		3, 2, 5b, 4,
		5, 4, 3b, 3
	], inf)),
	\ctranspose, [-12, -24],
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code

// ++ code copied from bruno

Pbindef(\melodyX).stop;
// -- end of copied code

// ++ code copied from bruno
(
~clock = SCLOrkClock.new(\wow).permanent_(true);
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno2020
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code
