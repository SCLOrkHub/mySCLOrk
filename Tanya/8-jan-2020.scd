SCLOrkChat.new("tanya");
{SinOsc.ar}.play;


// ++ code copied from bruno
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: [48, 51, 55, 60, 70].choose.midicps, // 48-24 is 2 octaves below
		mul: SinOsc.ar(1/9).range(0, 0.1)
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
