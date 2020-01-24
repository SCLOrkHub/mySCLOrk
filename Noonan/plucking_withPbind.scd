(
SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1, mix = 0.5;

	var env, snd;
	env = Env.linen(0.2, decay, 0).kr(doneAction: 2);
	snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: dampen
	);
	snd = FreeVerb.ar(snd, mix, 0.4, 0.8).clip;
    Out.ar(0, [snd, snd]);
	//DetectSilence.ar(in: snd, amp: 0.0001, time: 0.01, doneAction: 2);
}).add;
)

(
Pbind(
	\instrument, "plucking",
	\midinote, Pseq([
		[60, 63, 67], [60, 63, 67], [60, 63, 67], [60, 63, 67], [60, 63, 67], [60, 63, 67], [60, 63, 68], [60, 63, 68],
	], inf),
	\dur, 0.25,
	\decay, 5,
	\mix, 0.6,
	\ctranspose, 0,
	\dampen, 0.6,
	\strum, Pwhite(0.01, 0.02),
	\amp, Pseq([0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.6, 0.8], inf)*1.2,
	\pan, Pseq([-0.25, 0.25], inf)
).play;
)