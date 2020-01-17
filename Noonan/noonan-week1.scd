SCLOrkChat.new("noonan");

// ++ code copied from bruno
(
Ndef(\test).fadeTime = 4;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: (60.midicps)*SinOsc.ar(256).range(0.25, 4) + MouseX.kr(200, 2000),
		mul: 0.1
	);
	/*snd = LPF.ar(
		in: snd,
		freq: MouseX.kr(200, 1000),
		mul: 2
	);*/
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
