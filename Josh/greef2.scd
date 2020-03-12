

// bad one
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




(
Ndef(\thing).fadeTime = 4;
Ndef(\thing, {
	var snd, freq, maxwidth;

	snd = LFPulse.ar([60, 60 * 2.pow(3/12), 60 * 2.pow(6/12)] * [6, 17]);
	snd = RLPF.ar(snd, LFNoise0.ar(8).range(120, 2400), 0.15, Slew.ar(LFClipNoise.ar(3), 100, 100));
	snd = CombN.ar(snd, 0.5, 0.5, -5);

	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh) * 10;

	snd = CombN.ar(snd, 0.5, 0.5, -5);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)