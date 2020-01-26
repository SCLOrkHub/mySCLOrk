(
var mainFreq = 36;
Ndef(\b, {
	var snd;

	snd = Saw.ar(mainFreq, 0.5);

	snd = LPF.ar(snd, Pulse.ar(1).range(100, 400));

	snd = Limiter.ar(Mix.ar(snd));
}).play;


Ndef(\c, {
	var snd;

	snd = Saw.ar(mainFreq*2, 0.5);

	snd = LPF.ar(snd, Pulse.ar(2).range(100, 600));

	snd = Limiter.ar(Mix.ar(snd));
}).play;

Ndef(\d, {
	var snd;

	snd = Saw.ar(mainFreq*3, 0.5);

	snd = LPF.ar(snd, Pulse.ar(3).range(300, 1000));

	snd = Limiter.ar(Mix.ar(snd));
}).play;

Ndef(\e, {
	var snd;

	snd = Saw.ar(mainFreq*4, 0.5);

	snd = LPF.ar(snd, Pulse.ar(4).range(100, 1000));

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\f, {
	var snd;

	snd = Saw.ar(36*5);

	snd = LPF.ar(snd, Pulse.ar(5).range(100, 1000));

	snd = Limiter.ar(Mix.ar(snd));
}).play;

)


SCLOrkChat.new("noonan")

// ++ code copied from jia
(
Ndef(\confusing, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise1.kr(2).range(1, 35).round(7); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 43 * harmonic + [Line.kr(-100, 100, 5)],
		mul: LFSaw.ar(4).range(0.1, 1)
	);
	snd = FreeVerb.ar(snd, 1, 1, 1);
	snd = BPF.ar(snd, 1000, 0.5).clip;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from aastha
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = Pulse.ar(2).range(1, 100).round(20); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 1 * harmonic + [LFTri.ar(1/2).range(-40, 300)],
		//mul: LFSaw.ar(4).range(0.1, 0.5)
		mul: Pulse.ar(8)
	);
	//snd = FreeVerb.ar(snd, 1, 1, 1);
	snd = LPF.ar(snd, SinOsc.ar(6).range(200, 800));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
