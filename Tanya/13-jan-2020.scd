SCLOrkChat.new("tanya")

// ++ code copied from bruno
SCLOrkClock.startSync;

(
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
)
// -- end of copied code

// ++ code copied from bruno
(
Pbindef(\test).quant = 4;
Pbindef(\test,
	\degree, Pseq([0, 1, 2, 3], inf) + Pwhite(1, 4) + [0, 2, 4],
	\dur, 1/8,
	\amp, 0.2, //Pwhite(0, 0.5)
	\legato, 0.1
).play(~clock, quant: 4)
)

Pbindef(\test).stop;
// -- end of copied code


Pbind(\degree, 7, \dur, 1/8, \amp, 1, \legato, 0.1).play(~clock, quant: 2)

// ++ code copied from bruno
24.midicps;
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * 7 + 15,
		mul: 0.1
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32,
		mul: LFTri.ar(freq: 12).range(0.001, 0.3)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from nicole
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 30.2 * 8 ,
		mul: Pulse.ar(freq: 1/10
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wowz).fadeTime = 1;
Ndef(\wowz, {
	var snd;
	snd = SinOsc.ar(VarSaw.ar(freq: [3*25,82]),
		mul: LFTri.ar(freq: 1/10).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code



{SinOsc.ar}.play;





// ++ code copied from bruno
(
Ndef(\um).fadeTime = 0;
Ndef(\um) {
	var snd;
	snd = LFSaw.ar(
		freq: LFPulse.ar(freq: 32 * rrand(1, 32)),
		mul: Env.perc(releaseTime: 0.4).kr
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: 32 * 2  * Line.kr(0.1, 10),
		mul: LFSaw.ar(1/4).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: 3 * 2 * Line.kr(10, 20, 0.5),
		mul: LFTri.ar(1).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * 1/2 * Line.kr(1, 18, 0.9),
		mul: LFSaw.ar(2).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		freq: 32 * Line.kr(1, rrand(0, 0.9), 0.5),
		mul: SinOsc.ar(
			freq: LFNoise0.kr(1).range(5, 10)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code


// ++ code copied from josh
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd, env;
	env = Env.perc.ar;
	snd = SinOsc.ar(env * 70, 0, 1);
	snd = LeakDC.ar(snd);
}).play;
)
// -- end of copied code




// ++ code copied from jia
(
Ndef(\wow).fadeTime = 3;
Ndef(\wow, {
	var snd;
	snd = LFTri.ar(
		freq: 2 * Line.kr(rrand(10,0), rrand(350, 0), 10.5),
		mul: SinOsc.ar(
			freq: LFNoise0.kr(5).range(1, 20)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code





// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1.001, 0.99] * 43 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(15).range(0.3, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code



