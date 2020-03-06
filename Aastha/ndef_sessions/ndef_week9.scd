SCLOrkChat.new("aastha");



// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = (43-12) * rrand(3, 20) * [1, 1.002, 2] * MouseX.kr(1,2);

	snd = LFPulse.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(6.1).range(1, 8)).range(0.1, 0.5) * MouseY.kr(1,2)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



// don't change this version
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

(
// ++ code copied from josh
(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5), 1000, 100)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: Slew.ar(LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5), 1000, 100)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
)
// -- end of copied code


// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	SinOsc.ar(
		freq: 40,
		mul: LFSaw.ar(1).range(0, 1)
	)
}).play;
)
// -- end of copied code


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
	snd.distort.distort.distort;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


