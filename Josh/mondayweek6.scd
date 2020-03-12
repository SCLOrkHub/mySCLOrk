(
Ndef(\depr, {
	var env, snd, delFreq;
	delFreq = SinOsc.ar(0.1).range(15, 18);
	env = Env.perc(attackTime: 0.02, releaseTime: 0.25, curve: -6).ar;
	snd = SinOsc.ar(freq: 550, mul: env);
	snd = CombL.ar(in: snd, maxdelaytime: 0.5, delaytime: 1/delFreq, decaytime: 2.5);
	snd = snd * Line.ar(start: 0, end: 5 * pi, dur: 0.75);
	snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd * 0.3)));
	//snd = FreeVerb.ar(snd, 0.5, 0.8);
}).play;
)

(
Ndef(\acc, {
	var env, snd, freq;
	env = Env.perc(attackTime: 10, releaseTime: 12, curve: 0).ar;
	freq = 60;
	//snd = LFNoise1.ar(720);
	snd = BrownNoise.ar;
	snd = BPF.ar(snd, [freq, freq * 3] * LinExp.ar(env, 0, 1, 1, 6), 0.5, env);
	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd * 0.3)));
	snd = FreeVerb.ar(snd, 0.5, 0.2);
}).play;
)

(

Ndef( \key1, {
	LFPulse.ar(9) * LFClipNoise.ar(9).range(0, 1)
});

Ndef( \barg1, {
	var snd = LFSaw.ar(43);
	snd = snd.pow(LFNoise1.kr(6).range(0.5, 1.5));
	snd = BPeakEQ.ar(
		in: snd,
		freq: [100, 200, 400, 800, 1600, 3200, 6400, 12800]
		    * LFNoise2.kr([0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9] * 5).range(1/1.5, 1.5),
		rq: 1,
		db: LFNoise2.kr([1, 2, 1.5, 1.7, 1.2, 1.8, 1.3, 2.1]).range(-160, 48), mul: 0.01);
	snd = Mix.ar(snd);
	snd = Compander.ar(
		in: snd,
		control: snd,
		thresh: 0.4,
		slopeBelow: 1,
		slopeAbove: 0.1);
	snd = (snd * 0.5).tanh;
	snd = snd * Slew.ar((1-Ndef(\key1)), 1000, 100);
}).play;
)

(
Ndef( \barg2, {
	var snd = LFPulse.ar(
		freq: 43 * [1, 1.5],
		mul: 0.025);
	snd = RLPF.ar(
		in: snd,
		freq: LinExp.ar(LFNoise1.ar(1), -1, 1, 100, 8600),
		rq: 0.2);
	snd = CombN.ar(
		in: snd,
		maxdelaytime: 0.15,
		delaytime: 0.15,
		decaytime: 15,
		mul: 0.5);
	snd = LeakDC.ar(snd);
	snd = snd * Slew.ar((Ndef(\key1)), 1000, 100);
	snd = Mix.ar(snd);
}).play;
)

(
Ndef(\denial1).fadeTime = 5;
Ndef(\denial1, {
	var snd, freq, env, trig, gate, array;

	trig = Dust.kr(5, 2, -1) * LocalIn.ar;
	trig = Env.linen(0, 1/5, 0).ar(doneAction: 0, gate: trig);
	env = Env.perc(0.001, 3, 0.5, -4).ar(doneAction: 0, gate: trig);

	LocalOut.ar(1 - trig);

	array = [16, 19, 21, 24, 29, 32];

	freq = TChoose.kr(trig, array);
	freq = freq/16;

	snd = SinOsc.ar(240 * freq, 0, env);
	snd = (CombN.ar(snd, 0.5, 0.5, 5) * LFNoise2.ar(3).range(0.25, 0.5)) + (CombN.ar(snd, 0.75, 0.75, 5) * LFNoise2.ar(3).range(0.25, 0.5));
	snd = LPF.ar(snd.tanh, 7200).softclip;
}).play;
)

(
Ndef(\xorCtrlA, {
	Slew.ar(LFNoise0.ar(3).range(0, 1), 8, 8)
});

Ndef(\xorCtrlB, {
	Slew.ar(LFNoise0.ar(5).range(0, 1), 8, 8)
});

Ndef(\xorCtrlC, {
	LFClipNoise.ar(10).range(0, 1)
});

Ndef(\xor, {
	var snda, sndb, snd;

	snda = LFPulse.ar(LinExp.ar(Ndef(\xorCtrlA), 0, 1, 40, 800)).range(0, 1);
	//snda = LFPulse.ar(MouseX.kr(40, 800)).range(0, 1);

	sndb = LFPulse.ar(LinExp.ar(Ndef(\xorCtrlB), 0, 1, 40, 800)).range(0, 1);
	//sndb = LFPulse.ar(MouseY.kr(40, 800)).range(0, 1);

	snd = (snda * sndb) + ((1 - snda) * (1 - sndb));
	snd = snd * Ndef(\xorCtrlC) * 0.25;

	snd = snd + DelayN.ar(snd, 0.67, 0.67) + DelayN.ar(snd, 0.5, 0.5);
	snd = snd * DelayN.ar(Ndef(\xorCtrlC), 0.33, 0.33);
}).play;


)

Stethoscope.new;

SCLOrkChat.new("josh")

// ++ code copied from SickJon
(
Ndef(\denial).fadeTime = 2;
Ndef(\denial, {
	var snd;

	snd = LFTri.ar(
		freq: (LFNoise0.ar(5).range(50, 800)) * SinOsc.ar(1, [0, pi]).range(0.99, 1.01),
		mul: LFNoise0.ar(5).range(0, 0.08);
	);

	snd = CombC.ar(snd, 0.4, Slew.ar(LFNoise0.ar(2).range(0.1, 0.3), 1, 1), 5);

	snd = snd * LFNoise2.ar(20).range(0.5, 1);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
