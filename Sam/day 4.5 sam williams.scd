
SCLOrkChat.new("sam");


// ++ code copied from bruno
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = SinOsc.ar(
		mul: 0.1
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

// -- end of copied code



// ++ code copied from bruno
Ndef(\wow).clear(60);
// -- end of copied code
