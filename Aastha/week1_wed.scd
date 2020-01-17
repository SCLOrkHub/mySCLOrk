//control + B starts the server
SCLOrkChat.new("aastha");



// ++ code copied from bruno

(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd;
	snd = Saw.ar(
		freq: [36, 48, 55, 58, 63, 74].choose.midicps,
		mul: Sin0sc.ar(1).range(0,0.1)
	);
	snd = Mix.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
Ndef(\test).clear(10);
// -- end of copied code
