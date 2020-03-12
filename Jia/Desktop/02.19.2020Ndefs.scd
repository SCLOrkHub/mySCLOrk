// ++ code copied from Zach
(
Ndef(\test).fadeTime = 0;
Ndef(\test, {
	var snd, freq;
	freq = 43 * rrand(4, 9);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// ++ code copied from bruno
(
Ndef(\deepListening).fadeTime = 1;
Ndef(\deepListening, {
	var snd, freq;
	freq = 43 * 4;

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from Zach
(
Ndef(\yuh).fadeTime = 0;
Ndef(\yuh, {
	var snd, freq;
	freq = 43 * SinOsc.ar(2).range(1, 15).round(1) * [2, 1.001] * MouseX.kr(1, 10);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFSaw.ar(3).range(0, 1) * MouseY.kr(1, 10)
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 5000));
	snd = Limiter.ar(Mix.ar(snd)).distort.distort
}).play;
)

// ++ code copied from bruno
(
// ++ code copied from Zach
Ndef(\yuh).fadeTime = 0;
Ndef(\yuh, {
	var snd, freq;
	freq = 43 * LFNoise0.ar(27).range(rrand(1, 5), 17).round(1.4) * [1, 1.01,1/2]);

	snd = LFSaw.ar(
		freq: freq,
		mul: LFPulse.ar53).range(0, 1);
	);
	snd = LPF.ar(snd, LFNoise0.ar(16).range(500, 15000));
	snd = FreeVerb.ar(snd, 0.6);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// ++ code copied from josh
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var snd, cake = [1, 1.5, 2, 3, 4];
	snd = SinOscFB.ar(
		freq: 40 * cake * MouseX.kr(1, 10),
		feedback: LFSaw.ar(cake).range(0, 1.5),
		mul:  LFPulse.ar53).range(0, 1) ;
	);
	snd = SinOsc.ar(0, snd * pi * 4);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from bruno
(// ++ code copied from Josh
Ndef(\a).fadeTime = 4;
Ndef(\a, {arg freq = 43, slope = 0.2, fade = 0.4, distance = 0.1, wdepth = 1.03, wtime = 0.15, wdec = 0.01, wspeed = 10;
	var pipea, pipeb, pipec, air, envair, enva, envb, envc, mix, melpipe, wobble, envwobble, trigger, wiipitch, bag;
	// HERE'S WHERE TO CHOOSE RANGE OF HARMONICS FOR BAGPIPE MELODY
	wiipitch = MouseX.kr(2, 16).round(1);
	// ^^^^^^^^^^^^^^^^^^HERE^^^^^^^^^^^^^^^^^^^^^^^^^^^
	trigger = Trig1.kr(
        in: abs(wiipitch - Delay1.kr(wiipitch)),
        dur: 0.001
    );
	/* bag = Trig1.kr(
        in: abs(~wiiB.kr - Delay1.kr(~wiiB)),
        dur: 0.001
    );*/
	envwobble = Env.pairs([[0, 1], [0.001, wdepth],  [wtime, wdepth], [wdec, 1]], -2).kr(gate: trigger);
	wobble = LFPulse.ar(freq: wspeed).range(1/envwobble, envwobble);
	melpipe = Saw.ar(freq: (freq * wobble * 4 * LFNoise2.kr([1, 1/3]).range(0.997, 1.003) * wiipitch), mul: 1/2);
	melpipe = melpipe + Pulse.ar(freq: (freq * wobble * 4 * LFNoise2.kr([1/2, 1/5]).range(0.997, 1.003) * wiipitch), width: 1/3, mul: 1/2);
	melpipe = HPF.ar(in: melpipe, freq: freq * 3, mul: 1/2) + HPF.ar(in: melpipe, freq: freq * 2, mul: 0.5);
	melpipe = LPF.ar(in: melpipe, freq: 13000, mul: 1.0); // mel mul was ~wiiA
	enva = Line.ar(start: 2 - (distance + 0.1), end: 2, dur: fade * 1);
	envb = Line.ar(start: 3 - (distance), end: 3, dur: fade * 0.9);
	envc = Line.ar(start: 4 - (distance + 0.05), end: 4, dur: fade * 1.1);
	pipea = Saw.ar(freq: freq * enva * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.99, 1.01), mul: enva/2);
	pipea = pipea + Pulse.ar(freq: freq * enva * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.98, 1.02), width: 1/3, mul: enva/2);
	pipeb = Saw.ar(freq: freq * envb * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.99, 1.01), mul: envb/2);
	pipeb = pipeb + Pulse.ar(freq: freq * envb * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.985, 1.015), width: 1/3, mul: envb/2);
	pipec = Saw.ar(freq: freq * envc * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.992, 1.008), mul: envc/2);
	pipec = pipec + Pulse.ar(freq: freq * envc * LFNoise2.kr(Array.rand(9, 0.1, 2.1)).range(0.98, 1.02), width: 1/3, mul: envc/2);
	air = BPF.ar(in: PinkNoise.ar(mul: 1), freq: ([(freq * enva) + (freq * envb) + (freq * envc)] * LFNoise2.kr(0.2).range(1.9, 2.1)), rq: 0.5, mul: LFNoise2.kr(1).range(0.5, 1)) + BPF.ar(in: PinkNoise.ar(mul: 1), freq: freq * 2, rq: 0.3, mul: 1);
	mix = LPF.ar(in: (pipea + HPF.ar(pipeb, freq * 2) + HPF.ar(pipec, freq * 3) + air), freq: 10000, mul: 0.25 * Line.kr(0, 1, 4));
	mix = (mix + melpipe);
	mix = Mix.ar(mix);
	mix = Limiter.ar(mix);
}).play;
)

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 2 * [3, 3.001];

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 20;
Ndef(\a, {
	var snd, freq;
	freq = 43 * 1 * [1, 1.00002];

	snd = SinOsc.ar(
		freq: freq,
		mul: 0.5
	);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)