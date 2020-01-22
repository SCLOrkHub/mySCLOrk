

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
