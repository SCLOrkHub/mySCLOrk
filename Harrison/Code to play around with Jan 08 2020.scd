SCLOrkChat.new("Harrison");



// ++ code copied from bruno
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd =   Saw.ar(
		freq:[48, 60, 36, 24,].choose.midicps,
		mul: SinOsc.ar(1/10).range(0,0.1)
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from tanya
SinOsc.ar(1).range(0, 0.1)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
