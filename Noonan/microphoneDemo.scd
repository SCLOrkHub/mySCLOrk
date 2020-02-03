

// ++ code copied from wow
// microphone demo for Jia
//
// boot server first

// simple amplification:
(
Ndef(\mic, {
	arg snd;
	snd = SoundIn.ar(0);
}).play;
)

// add some reverb
(
Ndef(\mic, {
	arg snd;
	snd = SoundIn.ar(0);
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.4,
		room: 0.9,
		damp: 0.5
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// a different reverb (a little nicer)
(
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 1.0);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// Echoes!
(
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.2, // < play with this number
		decaytime: 5 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// more extreme echoes ('comb filter')
// very short echoes (every 0.02 seconds)
// produce a frequency ('robot voice')
(
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.02, // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)



// Careful with feedback!
// (turn your speaker away from the mic if need be)
(
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.0) + (wet * 0.0);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: LFNoise0.ar(1).range(0.02, 0.08), // < play with this number
		decaytime: 1 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// -- end of copied code
