//klank


(
SynthDef('help-dynKlank', { |out,
    freqs (#[100, 200, 300, 400]),
    amps (#[1, 0.3, 0.2, 0.05]),
    rings (#[1, 1, 1, 2])|

    Out.ar(out, DynKlank.ar(`[freqs, amps, rings], WhiteNoise.ar * 0.001))
}).add
)

a = Synth('help-dynKlank');

a.setn(\freqs, Array.rand(4, 500, 2000));
a.setn(\amps, Array.exprand(4, 0.01, 1));

{ Out.kr(102, MouseX.kr(1, 2) * Array.rand(4, 500, 2000)) }.play;
a.mapn(\freqs, 102, 4);




// ++ code copied from bruno
(
Ndef(\deepListening).fadeTime = 1;
Ndef(\deepListening, {
	var snd, freq;
	freq = 43 * [3, 4, 9, 10, 12];

	snd = Saw.ar(
		freq: freq,
		mul: Pulse.ar(MouseX.kr(0.5, 200)).range(0, 0.4)
	);
	snd = Fold.ar(snd, 0, MouseY.kr(0, 1));
	snd = BMoog.ar(snd, LFSaw.kr(1).range(20, 20000));
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from Zach
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(2, 7);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(6).range(0, 0.2);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
// ++ code copied from Zach
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * LFNoise0.ar(17).range(rrand(1, 5), 17).round(1.4) * [1, 1.01,1/2];

	snd = LFPulse.ar(
		freq: freq,
		mul: LFPulse.ar(6).range(0, 0.3);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 15000));
	snd = FreeVerb.ar(snd, 0.9);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(
// -- end of copied code

// ++ code copied from josh
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd, cake = [1, 1.5, 2, 3, 4];
	snd = SinOscFB.ar(
		freq: 40 * cake,
		feedback: LFSaw.ar(cake).range(0, 1.5),
		mul: 1
	);
	snd = SinOsc.ar(0, snd * pi * 4);
	snd = FreeVerb.ar(snd, 0.5);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code


// ++ code copied from bruno
(
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.0012];

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 10;
Ndef(\a, {
	var snd, freq;
	freq = 43 * rrand(1, 10) * [1, 1.002, 2];

	snd = SinOsc.ar(
		freq: freq,
		mul: LFPulse.ar(LFPulse.ar(2.1).range(2, 4)).range(0.1, 0.5)
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)
// -- end of copied code

// ++ code copied from josh
(
Ndef( \a, {
	var snd;
	snd = DC.ar(2);
	snd = Limiter.ar(Mix.ar(snd));
}).play
)
// -- end of copied code
