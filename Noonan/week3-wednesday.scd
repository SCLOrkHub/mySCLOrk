(
Ndef(\a).fadeTime = 2;
Ndef(\a, {
	var vibrato, harmonic, snd1, snd2, snd3, snd;
	// round numbers to ensure integers only:
	harmonic = [3.95, 3.975, 4, 4.025, 4.05];
	vibrato = SinOsc.ar(16).range(-20, 20);
	snd1 = Pulse.ar(
		freq: 43 * harmonic + vibrato,
		mul: SinOsc.ar(1).range(0, 0.6)
	);
	snd2 = SinOsc.ar(
		freq: 43*[2, 3],
		mul: LFPulse.ar(2).range(0, 0.2)
	);
	snd1 = HPF.ar(snd1, 800);
	snd2 = LPF.ar(snd2, 200);
	snd = snd1*0.8 + snd2*0.2;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(1, 7);

	snd = Saw.ar(
		freq: freq,
		mul: Env.triangle(dur: rrand(9, 15)).kr;
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// -- end of copied code

// ++ code copied from bruno

SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\x,
	\instrument,
	\dur, 0.25,
	\degree, Pseq([0, 0, 1, 1, 2, 2, 3, 3], inf),
	\ctranspose, Pseq([[-24, -17], [-12, -5], [0, 7], [-12, -5]], inf),
	\amp, 0.1
).play(~clock, quant: 4)
)
// -- end of copied code

// ++ code copied from bruno
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(releaseTime: 0.25, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq * [1, 0.999, 1.0001], 0.25, 0.75);
	snd = snd * env;
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

// ++ code copied from bruno
(
Pbindef(\x).quant = 4;
Pbindef(\x,
	\instrument, "harpsichord1",
	\dur, 0.25,
	\degree, Pseq([0, 0, 1, 1, 2, 2, 3, 3], inf),
	\ctranspose, Pseq([[-24, -17], [-12, -5], [0, 7], [-12, -5]], inf),
	\amp, 0.1,
	\strum, 0.4
).play(~clock, quant: 4)
)
// -- end of copied code
