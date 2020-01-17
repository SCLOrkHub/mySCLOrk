//control + enter runs the line, control + b boots the sound server
SCLOrkChat.new("aastha")

// ++ code copied from bbb - this is a code block
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: 67.midicps,
		mul: 0.1
	);
	snd = Mix.ar(snd);
}).play;
) //plays A note of piano, 440Hz tells you that
// -- end of copied code

// ++ code copied from bbb
Ndef(\test).clear(5)
// -- end of copied code
