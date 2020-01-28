Quarks.update("SCLOrkTools");
Quarks.uninstall("SCLOrkTools");
SCLOrkChat.new("tanya");

// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code
~clock.permanent = true;


// ++ code copied from bruno
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
	\dur, 1 * Prand([0, 0, 0, 0.5], inf),
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2, 1, 0, 3], inf) + 1/4,
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\melody1).stop;

// -- end of copied code

// ++ code copied from luken
~clock = SCLOrkClock.new(\messup).permanent_(true);
~clock.play({ ~clock.beats.postln; 1; });
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\melody2, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2], inf),
	\rel, 0.25
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


//  nursery rhyme

(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pser([3, 0, 1, 2], inf) + 12,
	\rel, 0.5
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code
Pbindef(\melodyX).stop;

(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 1/2,
	\amp, 0.5,
	\degree, Prand([3, 0, 1, 2], inf) + 12,
	\rel, 0.5
).play(~clock, quant: 4).quant = 4;
)





// HALLOWEEEN VIBES

// ++ code copied from bruno
(
Pbindef(\melodyX, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 1/3,
	\amp, 0.5,
	\degree, Pstutter(4, Pseq([
		3, 0, 1b, 2,
		3, 0, 1b, -1,
		-1, 1b, 0, 3,
		2, 1b, 0, 3
	], inf)),
	\ctranspose, [0, 12],
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code

// ++ code copied from bruno
(
~clock = SCLOrkClock.new(\dank);
~clock.play({ ~clock.beats.postln; 1; });
)







(
Pbindef(\melodyX, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 1/3,
	\amp, 0.5,
	\degree, Pstutter(4, Pseq([
		3, 0, 1b, 2,
		3, 0, 1b, -1,
		-1, 1b, 0, 3,
		2, 1b, 0, 3,
		3, 0, 1b, 2
	], inf)),
	\ctranspose, [12, -12],
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code

// Billie Ellish
(
Pbindef(\melodyX, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 1/3,
	\amp, 0.5,
	\degree, Pstutter(4, Pseq([
		3, 0, 1b, 2,
		3, 0, 1b, -1,
		-1, 1b, 0, 3,
		2, 1b, 0, 3,
		3, 0, 1b, 2
	], inf)),
	\ctranspose, [24, -12],
	\rel, 0.25
).play(~clock, quant: 4).quant = 4;
)

// spooky but squeaky
(
Pbindef(\melodyY, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 0.28,
	\amp, 0.5 * 1.5,
	\degree, Pstutter(4, Pseq([
		3, 0, 1b, 2,
		3, 0, 1b, -1,
		-1, 1b, 0, 3,
		2, 1b, 0, 3,
		3, 0, 1b, 2
	], inf)),
	\ctranspose, [-12, 24],
	\rel, Pwhite(0.01, 0.9),
).play(~clock, quant: 4).quant = 4;
)
Pbindef(\melodyY).stop;

// spooky but squeaky
(
Pbindef(\melodyY, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1 * 0.28,
	\amp, 0.5 * 1.5,
	\degree, Pstutter(2, Pseq([
		-1, 1b, 0, 3,
		2, 1b, 0, 3,
		3, 0, 1b, 2,
		3, 0, 1b, -1,
		3, 0, 1b, 2
	], inf)),
	\ctranspose, [0, 10],
	\rel, Pwhite(0.3, 0.9),
).play(~clock, quant: 4).quant = 4;
)
Pbindef(\melodyY).stop;




// ++ code copied from bruno2020
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from josh
(
SynthDef("harpsy", { arg out = 0, freq = 440, amp = 0.1, pan = 0, rel = 3;
    var env, snd;
	env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(MouseY.kr(0.01), [0, pi/2, pi, 3pi/2]).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1).distort.distort;
	snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
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
// -- end of copied code
