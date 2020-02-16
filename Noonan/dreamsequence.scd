(
SynthDef(\cheapPiano1, {
	arg
	//Standard values
	out = 0, freq = 440, amp = 0.1, att = 0.001, rel = 1, pan = 0,
	//These range from 0 to 1
	tone = 0.25, hollowness = 0;

	var hammer, snd, delay, tonefreq, env;

	env = Env.perc(att, rel*0.6, amp * 4, -1).ar(doneAction: 2);

	// Delay line times: freq, freq - 4 cents, freq + 3 cents. In the original this was done by converting freq to midi.
	delay = (1 / (freq * [2.pow(-0.04/12), 1, 2.pow(0.03/12)]));
	tonefreq = tone.linlin(0, 1, 1000, 5000);

	hammer = Decay2.ar(
		in: Impulse.ar(0.001),
		attackTime: 0.008,
		decayTime: 0.04,
		mul: LFNoise2.ar(freq: amp.linlin(0, 1, tonefreq, 2 * tonefreq), mul: 0.25)
	); //Try LFNoise1, LFNoise0, or even LFClipNoise above for a slightly grainier sound.

	snd = CombL.ar(hammer, delay, delay, 50 * amp);
	snd = HPF.ar(snd, hollowness.linlin(0, 1, 50, 1000));
	snd = snd * env;
	snd = Limiter.ar(snd);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "based on something posted 2008-06-17 by jeff, based on an old example by james mcc",
	category: \keyboards,
	tags: [\casio, \piano, \pitched]
	)
).add;

SynthDef("plucking", {arg amp = 0.1, freq = 440, decay = 5, dampen = 0.1, mix = 0.5;

var env, snd;
env = Env.linen(0.2, decay, 0).kr(doneAction: 2);
snd = Pluck.ar(
        in: WhiteNoise.ar(amp),
        trig: Impulse.kr(0),
        maxdelaytime: 0.1,
        delaytime: freq.reciprocal,
        decaytime: decay,
        coef: dampen);
	snd = FreeVerb.ar(snd, mix, 1, 1);
    Out.ar(0, [snd, snd]);
}).add;
)

(
~clock = TempoClock.new(100/60).permanent_(true);

~piano1 = Pbind(
	\instrument, "cheapPiano1",
    \ctranspose, 12,
    \legato, 0.4,
	\dur, 2,
	\midinote, Pseq([
		[57, 61, 65, 69]], inf),
	\amp, 0.4,
	\strum, 0.1
).play(~clock);

~piano2 = Pbind(
	\instrument, "cheapPiano1",
    \ctranspose, 12,
    \legato, 0.4,
	\dur, Pseq([Rest(1), 1], inf),
	\midinote, Pseq([
		\rest, [71, 67, 63, 59]], inf),
	\amp, 0.4,
	\strum, 0.1
).play(~clock);
)

(
~clock = TempoClock.new(110/60).permanent_(true);

~chordsMain = Pbind(
	\instrument, "plucking",
	\midinote, Pseq([Pseries(57, 2, 8), Pseries(73, -2, 8)], inf),
	\dur, 0.25,
	\decay, 5,
	\mix, 0.4,
	\ctranspose, 0,
	\dampen, 0.3,
	\amp, 0.4
).play(~chords);
)