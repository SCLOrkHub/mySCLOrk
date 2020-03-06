

// ++ code copied from bruno
(
Ndef(\deepListening).fadeTime = 4;
Ndef(\deepListening, {
	var snd, freq;
	freq = 43 * [3, 4.1, 5.2];

	snd = SinOscFB.ar(
		freq: freq,
		feedback: LFSaw.ar(1/4).range(0.5, 2)
	);
	snd = SinOsc.ar(0, snd * pi * 4, mul: LFPulse.ar(freq: SinOsc.ar(1/8).range(1/2, 2), width: SinOsc.ar(1/5).range(0.4, 1)));
	snd = FreeVerb.ar(snd, 0.5, 0.5, 1);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


