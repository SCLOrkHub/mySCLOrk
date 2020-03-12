(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFClipNoise.ar(1).range(0, 0.5), 1000, 1000)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from nicole
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 40 * rrand(1, 10) * [-7, -5, -3];

	snd = Saw.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(-2.1).range(2, 4)).range(1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = CombC.ar(snd, 0.5, LFNoise0.ar(2).range(0.1, 0.4), 2, Slew.ar(LFPulse.ar(2, 0.9, 0.2).range(0, 1000)), 100, 100);
	snd = LeakDC.ar(Limiter.ar(snd * 100000));
	snd = HPF.ar(HPF.ar(snd, 10000, LFNoise2.ar(0.5).range(0, 100)), 8000);

}).play;
)
// -- end of copied code
Stethoscope.new;

// ++ code copied from bruno
(
Ndef(\a, {
	var snd = WhiteNoise.ar(1);
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(1000, 9000),
		mul: 0.3
	);
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)


// -- end of copied code
