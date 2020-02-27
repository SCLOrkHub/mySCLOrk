SCLOrkChat.new("Zach");


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




// ++ code copied from bruno
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





// ++ code copied from Lucas
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(2, 15);

	snd = Pulse.ar(
		freq: freq,
		width: SinOsc.ar(),
		mul: LFSaw.ar(5).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
