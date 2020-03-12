SCLOrkChat.new("dana")

// ++ code copied from bruno
(
{ SinOsc.ar(freq: MouseX.kr(400, 1000), mul: 0.1) }.play
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow, {
	SinOsc.ar(
		freq: MouseX.kr(40, 1000),
		mul: 0.1)
}
).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow, {
	SinOsc.ar(
		freq: MouseX.kr(10, 5000),
		mul: MouseY.kr(0, 1)
	)
}
).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow, {
	SinOsc.ar(
		freq: MouseX.kr(40, 5000),
		mul: MouseY.kr(0, 1)
	)
}
).play;
)
// -- end of copied code
