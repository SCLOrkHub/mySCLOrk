SCLOrkChat.new("jia")

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd;
	snd = LFSaw.ar(
		freq: [48, 55, 58, 63].choose.midicps,
		mul: SinOsc.ar(1/4).range(0,0.1)
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
