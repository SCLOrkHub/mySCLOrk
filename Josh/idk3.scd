

// ++ code copied from jon
(
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(500, 1000) * LFNoise1.ar(5).range(1, 2);
	maxwidth = 100;

	snd = SinOsc.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);

	snd = RLPF.ar(snd, 0, 0.002);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


{LFNoise1.ar(1000)}.plot;

(
Ndef(\thing, {
	var snd, freq, maxwidth;

	snd = LFSaw.ar(60);
	snd = RLPF.ar(snd, LFNoise0.ar(8).range(120, 2400), 0.15, LFClipNoise.ar(3));
	snd = CombN.ar(snd, 0.5, 0.5, -5);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)