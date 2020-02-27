(
Ndef(\mic, { // stranger things
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.0);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: LFNoise0.ar(1).range(0.02, 0.08), // < play with this number
		decaytime: 1 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// SynthDef
(
/* Retrieved from
http://sccode.org/1-5aD

Original from SC Examples Folder some small pieces, Julian Rohrhuber, 2007

Modified by Bruno Ruviaro and Josh Mitchell 8/19.
*/

SynthDef(\strings, {
	arg
	//Standard Definitions
	out = 0, freq = 440, amp = 1, gate = 1, pan = 0, freqLag = 0.2, att = 0.001, dec = 0.1, sus = 0.75, rel = 0.3,
	//Other Controls (mix ranges from 0 - 1)
	rq = 0.001, combHarmonic = 4, sawHarmonic = 1.5, mix = 0.33;

	var env, snd, combFreq;

	combFreq = 1 / (Lag.kr(in: freq, lagTime: freqLag / 2) * combHarmonic);

	env = Env.adsr(att, dec, sus, rel, amp).kr(gate: gate, doneAction: 2);

	snd = SyncSaw.ar(syncFreq: freq * WhiteNoise.kr().range(1/1.025, 1.025), sawFreq: freq * sawHarmonic, mul: 8);
	snd = (snd * (1 - mix)) + PinkNoise.ar(180 * mix);
	snd = CombL.ar(snd, combFreq, combFreq, -1); //Try positive 1 for decay time as well.
	snd = Resonz.ar(snd, Lag.kr(in: freq, lagTime: freqLag), rq).abs;
	snd = snd * env;
	snd = Limiter.ar(snd, amp);

	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "Original from Julian Rohrhuber, 2007",
	category: \strings,
	tags: [\pitched]
	)
).add;

);
// Pattern demo
(
Pbindef( \strings,
	\instrument, "strings",
    //\ctranspose, -6,
    \legato, Pseq([0.9, 0.5, 0.5, 0.9, 0.5, 0.5, 1], inf),
	\dur, Pseq([1, 1/2, 1/2, 1, 1/2, 1/2, 1], 1),
	\degree, Pseq([[-4, 7, 12], [-3, 6, 13], [-2, 5, 14], [-3, 6, 15], [-3, 7, 13], [-3, 6, 11], [-2, 5, 12]], 1),
	\amp, 0.5,
).play;
);