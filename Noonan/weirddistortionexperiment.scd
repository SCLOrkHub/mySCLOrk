(
SynthDef("bClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq, 0.5);

	snd = LPF.ar(snd, Pulse.ar(1).range(100, 400));
	env = Env.asr(0.001, 1, 0.5).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("cClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*2, 0.5);

	snd = LPF.ar(snd, Pulse.ar(2).range(100, 600));
	env = Env.asr(0.001, 1, 0.5).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("dClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*3, 0.5);

	snd = LPF.ar(snd, Pulse.ar(3).range(300, 1000));
	env = Env.asr(0.001, 1, 0.5).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("eClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*4, 0.5);

	snd = LPF.ar(snd, Pulse.ar(4).range(100, 1000));
	env = Env.asr(0.001, 1, 0.5).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

Pbindef(\bClick,
	\instrument, "bClick",
	\dur, Pseq([Pn(4, 3), 2, 2], inf)/2,
	\degree, Pseq([0, 2, 3, 0, -2b], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;

Pbindef(\cClick,
	\instrument, "cClick",
	\dur, Pseq([Pn(4, 3), 2, 2], inf)/2,
	\degree, Pseq([0, 2, 3, 0, -2b], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;

Pbindef(\dClick,
	\instrument, "dClick",
	\dur, Pseq([Pn(4, 3), 2, 2], inf)/2,
	\degree, Pseq([0, 2, 3, 0, -2b], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;


Pbindef(\eClick,
	\instrument, "eClick",
	\dur, Pseq([Pn(4, 3), 2, 2], inf)/2,
	\degree, Pseq([0, 2, 3, 0, -2b], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;


SynthDef("hihat", {arg amp = 0.5, att = 0.01, rel = 0.2, ffreq = 6000, pan = 0;
    var env, snd;
    env = Env.perc(
        attackTime: att,
        releaseTime: rel,
        level: amp*1.2
    ).kr;
    snd = WhiteNoise.ar;
    snd = HPF.ar(in: snd, freq: ffreq);
    snd = snd * env;
    Out.ar(0, Pan2.ar(snd, pan));
    DetectSilence.ar(snd, doneAction: 2);
}).add;

SynthDef("sosKick", {
	arg
    //Standard Values
	out = 0, pan = 0, amp = 1, curve = -4, drumAmp = 1, beaterAmp = 0.02,
	//drum Controls
	drumFreq = 50, drumHarmonic = 2, drumSweep = 0.02, drumAtt = 0.005, drumRel = 0.4,
	drumFilter = 1000, modIndex = 6.5, modFreq = 5,
	//beater Controls
	beaterFreq = 500, beaterHarmonic = 12, beaterSweep = 0.03, beaterAtt = 0.01, beaterRel = 0.3;

	var drumEnv, drumContour, drum, beaterContour, beaterEnv, beater, snd;

	drumEnv = Env.perc(attackTime: drumAtt, releaseTime: drumRel, level: drumAmp, curve: curve).kr;

	drumContour = Line.kr(start: drumFreq * drumHarmonic, end: drumFreq, dur: drumSweep);

	drum = PMOsc.ar(
		        carfreq: drumContour,
				modfreq: modFreq,
				pmindex: modIndex);

	drum = LPF.ar(in: drum, freq: drumFilter, mul: drumEnv);

	beaterEnv = Env.perc(attackTime: beaterAtt, releaseTime: beaterRel, level: beaterAmp, curve: curve).kr;

	beaterContour = Line.kr(start: beaterFreq * beaterHarmonic, end: beaterFreq, dur: beaterSweep);

	beater = HPF.ar(in: WhiteNoise.ar, freq: beaterFreq);

	beater = LPF.ar(in: beater, freq: beaterContour, mul: beaterEnv*2);

	snd = Mix.ar(drum + beater) * amp;

	//snd = snd.distort.distort;

    DetectSilence.ar(in: snd, doneAction: 2);

    Out.ar(out, Pan2.ar(snd, pan));

},
metadata: (
	credit: "Renick Bell",
	category: \drums,
	tags: [\pitched, \kick, \sos]
	)
).add;

Pbindef(\hihat,
	\instrument, "hihat",
	\dur, 0.25,
	\rel, Pseq([0.1, 0.4, 0.1, 0.4, 0.1, 0.4, 0.1, 0.4], inf),
	\pan,0,
	\amp, 0.8,
	\ffreq, Pwhite(11000, 15000)
).play(~clock, quant: 4).quant = 4;

Pbindef(\kick,
	\instrument, "sosKick",
	\modFreq, [4, 5, 6],
	\modIndex, Pwhite(0.1, 8.5),
	\beaterHarmonic, Pwhite(1.5, 8),
	\dur, 0.5,//Pseq([1, 1, 0.25, 0.75, 1], inf),
	\amp, 0.9,
	\pan, -0.25
).play(~clock, quant: 4).quant = 4;
)

// ++ code copied from jia
(
Ndef(\confusing, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise1.kr(2).range(1, 35).round(7); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 43 * harmonic + [Line.kr(-100, 100, 5)],
		mul: LFSaw.ar(4).range(0.1, 1)
	);
	snd = FreeVerb.ar(snd, 1, 1, 1);
	snd = BPF.ar(snd, 1000, 0.5).clip;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from aastha
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = Pulse.ar(2).range(1, 100).round(20); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 1 * harmonic + [LFTri.ar(1/2).range(-40, 300)],
		//mul: LFSaw.ar(4).range(0.1, 0.5)
		mul: Pulse.ar(8)
	);
	//snd = FreeVerb.ar(snd, 1, 1, 1);
	snd = LPF.ar(snd, SinOsc.ar(6).range(200, 800));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
