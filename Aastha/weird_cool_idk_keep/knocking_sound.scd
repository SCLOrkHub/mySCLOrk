// SynthDef
(
/*
Original Author Unknown.

Modified by Bruno Ruviaro and Josh Mitchell 8/19.
*/

SynthDef("kickRingz", {
	arg out = 0, pan = 0, freq = 40, amp = 1, decay = 0.25, ffreq = 1000;

	var snd;

	snd = Ringz.ar(
		    in: LPF.ar(in: Impulse.ar(0), freq: ffreq),
		    freq: freq,
		    decaytime: decay,
		    mul: amp
	);

	snd = snd.tanh.sin * 2;

	DetectSilence.ar(in: snd, doneAction: 2);

	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "Author Unknown",
	category: \drums,
	tags: [\unpitched, \bass]
	)
).add;

);
// Pattern demo
(
Pbindef( \kickRingz,
	\instrument, "kickRingz",
	\dur, Pseq([0.5, 0.25, 0.25, 0.5, 1, 0.5, 1], inf),
	\freq, Pwhite(37, 45, 48),
	\decay, Pwhite(0.2, 0.33, 6),
	\amp, 1
).play;
);