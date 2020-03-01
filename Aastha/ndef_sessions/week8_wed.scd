SCLOrkChat.new("aastha");


// ++ code copied from sam
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
		delaytime: 0.4, // < play with this number
		decaytime: 5 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
