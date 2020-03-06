


// ++ code copied from bruno
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * SinOsc.ar(1/30).range(1,5), // choose harmonic from 1 to 32
		mul: 0.5 // volume
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code



(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var wav, snd;
	wav = LFPulse.ar(MouseY.kr(2, 100), width: SinOsc.ar(MouseX.kr(0.1, 1));
	snd = Saw.ar(
		freq: 43 * LFSaw.ar(1/15).range(3,20), // choose harmonic from 1 to 32
		mul: 0.5 * wav)// volume
	);
	snd = BMoog.ar(snd, wav);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;


// ++ code copied from josh
(
Ndef(\a).fadeTime = 3;
Ndef(\a, {
	var snd = SinOsc.ar(
		freq: 43 * 16 * [1.05, SinOsc.ar(5).range(1, 2)], // choose harmonic from 1 to 32
		mul: LFNoise1.ar(20).range(0, 0.5) // volume
	);
	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh);
	snd = snd * 20;
	snd = snd.tanh;
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code
