SCLOrkChat.new("bbb");

// control + b to boot sound server

// control + enter

LFNoise0

{ SinOsc.ar(300) }.plot
(
Ndef(\test).fadeTime = 1;
Ndef(\test, {
	var snd, freq;
	freq = Dseq([55, 56, 67, 80], inf);

	snd = Pulse.ar(
		freq: TChoose.kr(.kr(Impulse.kr(1), 0, freq),
		mul: LFSaw.ar(1).range(0, 0.1)
	);
	snd = Mix.ar(snd);
}).play;
)

// ++ code copied from bbb
Ndef(\test).clear(10);
// -- end of copied code
