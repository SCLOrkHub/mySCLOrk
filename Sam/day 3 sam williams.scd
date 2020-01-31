//open sclork chat
SCLOrkChat.new("sam");


//yeet

// ++ code copied from bruno
(
{ Saw.ar(freq: MouseX.kr(40, 4000), mul: 0.1) }.play
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow, {
	Pulse.ar(
		freq: MouseX.kr(10, 3000),
		mul: MouseY.kr(0,1)
	)
}
).play;
)
// -- end of copied code
