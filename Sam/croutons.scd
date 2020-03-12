{ SinOsc.ar }.play;

Quarks.update("SCLOrkTools");

SCLOrkChat.new("bruno", true);



// CLOCK (do only once)
(
SCLOrkClock.startSync;
~clock = SCLOrkClock.new;
)

// SynthDef (run once, or every time you change something)
(
SynthDef("betterCroutons", {
	arg out = 0, freq = 261, tone = 3, att = 0, rel = 2, curve = -6, amp = 0.8, pan = 0, modLo = 5.25, modHi = 5.5, delay = 0.1, decay = 10;
	var env, snd, mod;
	env = Env.perc(attackTime: att, releaseTime: rel, curve: curve).kr;
	mod = Rand(modLo, modHi);
	snd = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: env * tone,
		mul: env * amp
	);
	snd = HPF.ar(snd, freq / 2);
	snd = Mix.ar(snd);
	snd = CombN.ar(
		in:  snd,
		maxdelaytime:  1,
		delaytime: delay,
		decaytime: decay
	);

	DetectSilence.ar(in: snd, amp:  0.01, time: 1, doneAction: 2);
	Out.ar(out, snd);
}).add;

Pbindef(\test2,
	\instrument, "betterCroutons",
	\ctranspose, 0,
	\dur, Pseq([2, 1, 1/2], inf) * 10,
	\amp, 0.2,
	\degree, Pseq([0, 7], inf),
	\att, 0.001,
	\rel, 5,
	\modLo, 5.4,
	\modHi, 5.45,
	\delay, 0.3,
	\decay, 6
).play();
)





(
Pbind(


	\degree, Pseq([0, 1, 2, 3], inf),
	\dur, 0.5,
).play(argClock: ~clock, quant: 4)
)


// ++ code copied from luken

(
SCLOrkClock.startSync;
~clock = SCLOrkClock.new;
)
// -- end of copied code

// ++ code copied from luken
(
SCLOrkClockMonitor.new
)
// -- end of copied code
