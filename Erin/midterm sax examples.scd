SCLOrkChat.new("erin");
// microphone demo for Erin
//
// boot server first

// clip the Korg mic on your saxophone, try the examples below.

// Note: if feedback happens, move sax away from loudspeaker

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
// Try short staccato notes on the sax:
(
Ndef(\mic).fadeTime = 5;
Ndef(\mic, {
	arg dry, wet, snd;
	dry = SoundIn.ar(0);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 1
	);
	// choose how much dry and wet sound (0 to 1 each)
	snd = (dry * 1.0) + (wet * 0.3);
	snd = snd + CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: LFSaw.ar(1).range(0.1, 0.2), // < play with this number
		decaytime: 10 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// more extreme echoes ('comb filter')
// very short echoes (every 0.02 seconds)
// produce a frequency ('robot voice')
// try short notes at first
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
		delaytime: 36.midicps.reciprocal, // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)



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
		delaytime: [36, 43, 51].midicps.reciprocal, // < play with this number
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
