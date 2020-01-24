SCLOrkChat.new("aastha");


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	var harmonic = [3, 30, 40, 45, 60, 75, 90] * 3;
	freq = harmonic * Saw.ar(1/6).range(0.1, 0.8);

	snd = Saw.ar(
		freq: freq,
		//mul: Env.triangle(dur: 25).kr; // stops automatically after 20 seconds
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(2, 7);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from jane
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * 4;

	snd = SinOsc.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno //really coool arpeggio thingy it sounds cool lol keep this
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * SinOsc.ar(1).range(2, 10).round(1) * [1, 1.001];

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


