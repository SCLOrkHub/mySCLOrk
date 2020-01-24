

// ++ code copied from bruno

// ++ code copied from tanya
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
// -- end of copied code






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
	\dur, 1,
	\herz, Pseq([24+12, 48, 27, 26], inf).midicps,
	\doIt, Pfunc({ |ev| Ndef(\myFreq, { ev.herz }) })
).play(~clock)
)
// use it inside another Ndef
(
Ndef(\wow).fadeTime = 4;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: Ndef(\myFreq).kr * [2, 4, 5], //Line.kr(1, rrand(8, 23), 0.5),
		mul: Pulse.ar(2).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, Ndef(\myFreq).kr * 8);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

Ndef(\wow2).clear(10)







// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([62, 63, 67, 68, 60, 74].midicps * 0.5) * LFNoise2.kr(1).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(4).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = LPF.ar(snd, LFNoise2.kr(0.3).exprange(100, 8000));
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from kaitlin
(
Ndef(\wow).fadeTime = 10;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([6,7].midicps) * LFNoise2.kr(9).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(10).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = LPF.ar(snd, 8000);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code





// ++ code copied from NATHAN
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (Saw.ar([60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(1).linlin(-1, 1, 0, 1) * snd.size, snd);
	// snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
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
	snd = (SinOsc.ar([62, 63, 67, 68, 60, 72].midicps * XLine.ar(10, 1, 50)) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(0.1).linlin(-1, 1, 0, 1) * snd.size, snd);
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


Ndef(\wow).clear(40);