


(
Ndef(\mic1, {
	arg amp = 1;
	var dry, wet, snd;
	dry = SoundIn.ar(0) * Env.linen(1, 2, 1).kr;
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 30/60   , // < play wneith this number
		decaytime: 1000// < and this number
	);
	snd = Limiter.ar(Mix.ar(snd)) * amp;
}).play;
)

Ndef(\mic1).set(\amp, 0);

(
Ndef(\mic2, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0) * Env.linen(1, 2, 1).kr;
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 30/60   , // < play wneith this number
		decaytime: 100 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)