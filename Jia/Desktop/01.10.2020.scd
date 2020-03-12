SCLOrkChat.new("jia");
Ndef;
SinOsc.ar;

// ++ code copied from bruno
(
{ SinOsc.ar(freq: MouseX.kr(100, 2000), mul: 0.1) }.play
)


// ++ code copied from bruno
(
Ndef(\wow, {
	LFSaw.ar(
		freq: MouseX.kr(200, 2000),
		mul: MouseY.kr(0, 0.3)
}
).play;
)
// -- end of copied code
