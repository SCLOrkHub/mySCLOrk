SCLOrkChat.new("b2020", true);

SCLOrkClock.startSync;


(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)

~clock.tempo = 60/60;


(
SynthDef("harpsy", { arg out = 0, freq = 440, amp = 0.1, pan = 0, rel = 3;
    var env, snd;
	env = Env.perc(releaseTime: rel, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, SinOsc.ar(MouseY.kr(1, 5)).range(0.25, 0.5));
	snd = snd * env;
	snd = LPF.ar(snd, LFPulse.kr(8).range(9999, 1003));
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

Pbindef(\melodyY).stop;

(
Pbindef(\melodyY,
	\instrument, "harpsy",
	// \dur, Pseq([2/3, 1/3], inf) * 1/2,
	\dur, 2 / 8,
	\amp, 0.5,
	\degree, Pstutter(8, Pseq([
		3, 0, 1, -2,
		-1b, -4, -1b, 0,
	], inf)),
	\ctranspose, Pseq([-24, -12], inf),
	\rel, 0.5, //Prand([0.25, 0.2, 0.25, 0.25, 0.3], inf) * 1
).play(~clock, quant: 4).quant = 4;
)


(
Pbindef(\faster2,
	\instrument, "harpsy",
	\dur, 1/4,
	\amp, 0.65,
	\degree, Pseq([Prand([3, 5]), 0, 1, 2], inf) + 2, // << quickie way to transpose pitch, just add a number
	\rel, 0.5
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster).resume;

Pbindef(\fas).stop;

Pbindef.gui

(
Pbindef(\fas3,
	\instrument, "harpsy",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([Prand([9, 7]), 6b, 5, 4], inf),
	\ctranspose, 12,
	\rel, 4
).play(~clock, quant: 4).quant = 4;
)

SCLOrkChat.new("bruno", true);


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
