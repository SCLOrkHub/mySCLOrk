// basic example
// copy paste this code into a new window, go from there
// save interesting snippets of code in a new file (extension .scd)
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	// env = Env.triangle(dur: 10, level: 0.5).kr;
	env = Env.sine(dur: 5, level: 0.5).kr;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = LFTri.ar(
		freq: 43 * [1, 3, 5, 3, 1] * LFPulse.ar(freq: 13), // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)



// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	// env = Env.triangle(dur: 10, level: 0.5).kr;
	env = Pulse.ar(1/[3,7]).range(0.1, 0.5) * 2;
	snd = SinOsc.ar(
		freq: 21 * 2, // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	// env = Env.triangle(dur: 10, level: 0.5).kr;
	env = Pulse.ar(freq: rrand(1, 8)/[2, 3, 4], width: 0.6).range(0.1, 0.5);
	snd = SinOsc.ar(
		freq: 43 * [30, 17, 10] * 1/4, // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code




// ++ code copied from NATHAN
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env, trig;
	// you can comment out one env line and uncomment the other to use it
	//env = Env.triangle(dur: 10, level: 0.5).kr;
	env = Env.sine(dur: 5, level: 0.5).kr;
	snd = LFNoise2.ar;
	trig = Dust.ar(100); //21
	snd = snd * Decay2.ar(trig, 0.001, 0.03);
	snd = LPF.ar(snd, TExpRand.ar(100, 500, trig));
	snd = Limiter.ar(Mix.ar(snd)) * 0.9;
}).play;
)
// -- end of copied code

// ++ code copied from NATHAN
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd;
	snd = SinOsc.ar(45.55 * 29 + [1, 2]);
	3.do {
	snd = MoogFF.ar(snd, PinkNoise.kr(6 ! 2).linlin(-1, 1, 10, 1000), 1);
	snd = (snd * 3).tanh;
	};
	snd = Limiter.ar(Mix.ar(snd)) * 0.9;
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, env;
	// you can comment out one env line and uncomment the other to use it
	env = Env.triangle(dur: 10, level: 0.5).kr;
	// env = SinOsc.ar(1/7).range(0, 0.5);
	snd = SinOsc.ar(
		freq: 45.5 * rrand(1, 8), // pick your harmonic number here
		mul: env
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code



// ++ code copied from bruno

// ++ code copied from tanya
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = LFPulse.ar(
		freq: 2 * Line.kr(1, rrand(8, 23), 0.5),
		mul: Pulse.ar(
			freq: WhiteNoise.kr(12).range(2, 29)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code
// -- end of copied code



// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = LFTri.ar(
		freq: 12 * Line.kr(1, rrand(12, 23), 0.5),
		mul: LFSaw.ar(
			freq: LFNoise0.kr(3).range(9, 19)
		).range(0, 0.5)
	);
	snd = Select.ar(LFNoise2.kr(6) * 2, [snd, Latch.ar(WhiteNoise.ar, Impulse.ar(1000)) * -6.dbamp]);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code





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
		Latch.ar(WhiteNoise.ar, Impulse.ar(20000)) * -6.dbamp,
		Gendy1.ar(1, 1, 1, 1, 100, 5000),
		Gendy1.ar(1, 1, 1, 1, 100, 3000),
		(SinOsc.ar(120) * LFNoise2.kr(61).linlin(-1, 1, 1, 32)).fold2,
	]);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code


// !!!!!!!! brings SCLOrk clock into the mix !!!!!!!!!!
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
		freq: Ndef(\myFreq).kr * [3, 2, 1], //Line.kr(1, rrand(8, 23), 0.5),
		mul: SinOsc.ar(
			freq: LFNoise0.kr(54).range(9, 19)
		).range(0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code




// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// ++ code copied from NATHAN
// ++ code copied from tanya
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([62, 63, 67, 60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(4).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = LPF.ar(snd, 8000);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// INSANE !
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([59, 63, 67, 60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(12).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = LPF.ar(snd, 2220);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)



(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([59, 63, 67, 60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(PinkNoise.kr(12).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = LPF.ar(snd, [2220, 4440]);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)



// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([62, 63, 67, 68, 60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(0.3).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = LPF.ar(snd, LFNoise2.kr(0.3).exprange(100, 8000));
	snd = snd + NHHall.ar(snd ! 2, 16, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code



// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([62, 63, 67, 68, 60, 72].midicps * XLine.ar(8, 1, 50)) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(0).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = LPF.ar(snd, LFNoise2.kr(0.3).exprange(100, 8000));
	snd = snd + NHHall.ar(snd ! 2, 16, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\wow).clear(40);
// -- end of copied code
