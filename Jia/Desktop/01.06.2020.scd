SCLOrkChat.new("jia");

// ++ code copied from bbb
(
Ndef(\test).fadeTime = 5;
Ndef(\test, {
	var snd;
	snd = SinOsc.ar(
		freq: 63.midicps, // + 12 for an octave up
		mul: 0.5
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ctrl b to boot serve

// ++ code copied from edmond
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd;
	snd = SinOsc.ar(
		freq: [51.125,59.125],
		mul: 0.1
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

(
Ndef(\test).fadeTime = 5;
Ndef(\test, {
	var snd;
	snd = LFTri.ar(
		freq: 64.midicps, // + 12 for an octave up
		mul: 0.5
	);
	snd = Mix.ar(snd);
}).play;


// ++ code copied from bbb
Ndef(\test).clear(5)
// -- end of copied code
