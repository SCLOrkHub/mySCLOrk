// ++ code copied from bruno

// ++ code copied from tanya
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd, env;
	env = Env.perc(60, 60).ar;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = SinOscFB.ar(
		freq: 22.775 * [1.95, 1.8, 1, 2.2, 2.05] * [1, (3 - env)],
		feedback: env * 2.5,//pick your harmonic number here
		mul: env,
	);
	snd = snd + LocalIn.ar(1);
	snd = Limiter.ar(Mix.ar(snd));
	snd = DelayN.ar(snd, 1, 1) + DelayN.ar(snd, 7, 7) + DelayN.ar(snd, 5, 5);
	snd = snd.tanh;
	LocalOut.ar(snd);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
// -- end of copied cod

// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: 32 * Line.kr(1, rrand(8, 23), 0.5),
		mul: LFPulse.ar(
			freq: LFNoise0.kr(1).range(9, 19)
		).range(0, 0.5)
	);
	snd = Select.ar(LFNoise2.kr(6).linlin(-1, 1, 0, 6), [
		snd,
		Latch.ar(WhiteNoise.ar, Impulse.ar(16000)) * -6.dbamp,
		Gendy1.ar(1, 1, 1, 1, 100, 1000),
		Gendy1.ar(1, 1, 1, 1, 100, 3000),
		(SinOsc.ar(50) * LFNoise2.kr(6).linlin(-1, 1, 1, 32)).fold2,
	]);
	snd = Limiter.ar(Mix.ar(snd * 0.2))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
// start clock and myFreq
(
SCLOrkClock.startSync;
~clock = SCLOrkClock.new;
~clock.play({ ~clock.beats.postln; 1; });
Ndef(\myFreq, { 32 });
)
// start pbindef to control myFreq
(
Pbindef(\x,
	\type, \rest,
	\dur, 1/2,
	\herz, Pseq([24, 24, 27, 26], inf).midicps,
	\doIt, Pfunc({ |ev| Ndef(\myFreq, { ev.herz }) })
).play(~clock)
)
// use it inside another Ndef
(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: Ndef(\myFreq).kr * 2, //Line.kr(1, rrand(8, 23), 0.5),
		mul: SinOsc.ar(
			freq: LFNoise0.kr(1).range(9, 19)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code
