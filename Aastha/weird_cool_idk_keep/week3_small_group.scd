SCLOrkChat.new("aastha");

Scale.directory;

(
Pbindef(\patterntest,
	// \instrument, "bagpipe",
	//\midinote, Pwhite(60, 72),
	\scale, Scale.harmonicMajor, //define your scale to elsewhere
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], inf), //pbind is gonna go up scales, not counting black keys
	//\degree, Pwhite(-7, 10), //b is flat, s is sharp
	\mtranspose, [0, 2], //starts 1 degree higher and you can build chords
	\dur, 0.25, //pseq([1, 0.1, 0.3], inf), //beats, running at 60bpm, you can specify this, more on that later
	\amp, 0.2 //between 0 and 1
).play;

)

Pbindef(\patterntest).stop;

//really cool beat: keep this!!!!!!!

(
Ndef(\wow).fadeTime = 0; // KEEP
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = SinOsc.ar( //can change
		freq: harmonic * 10 * Line.kr(0.5, 0, 5.5),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)




// ++ code copied from noonan
(
SynthDef("bClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq, 0.5);

	snd = LPF.ar(snd, Pulse.ar(1).range(100, 400));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("cClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*2, 0.5);

	snd = LPF.ar(snd, Pulse.ar(2).range(100, 600));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("dClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*3, 0.5);

	snd = LPF.ar(snd, Pulse.ar(3).range(300, 1000));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("eClick", { arg freq, gate = 1;
	var snd, env;
	snd = Saw.ar(freq*4, 0.5);

	snd = LPF.ar(snd, Pulse.ar(4).range(100, 1000));
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);

	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);

	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

SynthDef("fClick", { arg freq, gate = 1;
	var env, snd1, snd2, sum;
    env = Env.perc(0.01, 0.2, 0.1).kr;
    snd1 = HPF.ar(
        in: WhiteNoise.ar,
        freq: 1800
    );
	snd2 = SinOsc.ar(freq: 180);
    sum = snd1 + snd2;
    sum = sum * env;
    sum=Limiter.ar(Mix.ar(sum));

}).add;

Pbindef(\bClick,
	\instrument, "bClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;

Pbindef(\cClick,
	\instrument, "cClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;

Pbindef(\dClick,
	\instrument, "dClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;


Pbindef(\eClick,
	\instrument, "eClick",
	\dur, 4,
	\degree, Pseq([0, 3, 0, -3], inf),
	\ctranspose, -24
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code

(
SynthDef("testwow", { arg freq, gate = 1;
	/*var snd, harmonic, env;
	harmonic = [4, 4.001, 4.99];
	snd = Saw.ar(
		freq * harmonic * 0.44 * 2,
	);
	env = Env.asr(0.001, 1, 1).kr(gate: gate, doneAction: 2);
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);*/

	/*var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = Pulse.ar(
		freq: harmonic * Pulse.ar(1/5).range(0.1, 0.8) * [1, 2, 6], // < let's finish on the tonic, 1 or 2 harmonic
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, 1300).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);*/

	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = SinOsc.ar( //can change
		freq: harmonic * 10 * Line.kr(0.5, 0, 5.5),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	//snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
	snd = Out.ar(0, snd);


	//DetectSilence.ar(snd, 0.001, 0.2, doneAction: 2);
}).add;

Pbindef(\testwow,
	\instrument, "testwow",
	\dur, 1/2,
	\amp, 0.4,
	\degree, Pseq([0, 0, 0, 0], inf),
).play(~clock, quant: 4).quant = 4;
)




