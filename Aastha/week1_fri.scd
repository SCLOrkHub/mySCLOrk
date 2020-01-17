// SCLOrkChat.new("Aastha");

//control shift p cleans the post window
//mul changes volume, it's between 0 and 1
//in freq: you can put Mou, it's an oscillator inside an oscillator

(
{ SinOsc.ar(freq: MouseX.kr(400, 1000), mul: 0.1)
}.play
)


// ++ code copied from bruno
(
{ SinOsc.ar(freq: MouseX.kr(400, 1000), mul: 0.1) }.play
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\wow, {
	SinOsc.ar(
		freq: MouseX.kr(400, 1000),
		mul: 0.1)
}
).play;
)
// -- end of copied code

(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd;
	snd = Saw.ar(
		freq: [1, 1.001, 0.99] * 10 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/5).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

