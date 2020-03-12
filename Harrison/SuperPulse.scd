SCLOrkChat.new("Dana");

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: [48, 55, 58, 63, 74].choose.midicps,
		mul: LFSaw.ar(1/10).range(0, 0.2)
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
