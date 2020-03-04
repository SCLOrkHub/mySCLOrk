(
Ndef(\mic).fadeTime = 16;
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = PitchShift.ar(snd, 2, 2, 2);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\mic).fadeTime = 16;
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = PitchShift.ar(snd, 2, 2, 2);

	snd = Limiter.ar(Mix.ar(snd), 0.0);
}).play;
)

Ndef(\mic).stop;