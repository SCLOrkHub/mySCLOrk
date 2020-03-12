





(
Ndef(\a).fadeTime = 10;
Ndef( \a, {
	var snd, freq;
	freq = 43 * [0.75, 1.25] * 0.50;

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.75
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
