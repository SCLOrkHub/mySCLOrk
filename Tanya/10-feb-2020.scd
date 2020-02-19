// play mobass and mobass1 together
// played this when Diya and Meha came to xchamber rehearsal

(
Ndef(\mobass).fadeTime = 1;
Ndef(\mobass, {
	var snd, freq;
	freq = [43, 42, 41, 40] + 24;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(1/2).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

(
Ndef(\mobass1).fadeTime = 1;
Ndef(\mobass1, {
	var snd, freq;
	freq = [43, 42, 41, 40] + 42 + 36; // add another 12 or 36

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(1/2).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// chimes
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = (SinOsc.ar([59, 63, 67, 60, 72].midicps) * LFNoise2.kr(6).linlin(-1, 1, 1, 5)).fold2;
	snd = Select.ar(LFNoise2.kr(12).linlin(-1, 1, 0, 1) * snd.size, snd);
	snd = LPF.ar(snd * 1/2, 2220);
	snd = snd + PitchShift.ar(DelayC.ar(snd, 0.5, 0.5), 0.03, 2);
	snd = snd + NHHall.ar(snd ! 2, 4, modDepth: 1)[0];
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

Ndef(\mobass).play;
Ndef(\mobass1).play;
Ndef(\wow).play;

Ndef(\mobass).stop;
Ndef(\mobass1).stop;
Ndef(\um).stop;
Ndef(\wow).stop;

(
Ndef(\um).fadeTime = 1;
Ndef(\um, {
	var snd, freq;
	freq = LFSaw.ar(freq: 220);

	snd = SinOsc.ar(
		freq: freq * 1/2,
		mul: SinOsc.ar(2).range(0, 0.1)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

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


// ++ code copied from luken
(
Ndef(\pm, {
	var snd = PMOsc.ar(43 * 2, 43 * SinOsc.ar(0.09, 1.0, mul: 2, add: 5), 0.5, SinOsc.ar(0.1, mul: 0.25, add: 1.5));
	snd * 0.2;
}).play;
)
// -- end of copied code
