SCLOrkChat.new;

(//depression
Ndef(\greef).fadeTime = 0;
Ndef(\greef, {
var env, snd, delFreq;
delFreq = SinOsc.ar(0.1).range(15, 18);
env = Env.perc(attackTime: 0.02, releaseTime: 0.25, curve: -6).ar;
	snd = SinOsc.ar(freq: 240 * 8, mul: env);
snd = CombL.ar(in: snd, maxdelaytime: 0.5, delaytime: 1/delFreq, decaytime: 5);
snd = snd * Line.ar(start: 0, end: 5 * pi, dur: 0.75);
snd = SinOsc.ar(freq: 0, phase: snd.mod(2pi));
snd = Limiter.ar(LeakDC.ar(Mix.ar(snd * 0.3)));
snd = FreeVerb.ar(snd, 0.5, 0.8);
}).play;
)

(//acceptance
Ndef(\greef, {
var env, snd, freq;
env = Env.perc(attackTime: 10, releaseTime: 12, curve: 0).ar;
freq = 60;
snd = LFNoise2.ar(720);
snd = BrownNoise.ar;
snd = BPF.ar(snd, [freq, freq * 3] * LinExp.ar(env, 0, 1, 1, 6), 0.5, env);
snd = Limiter.ar(LeakDC.ar(Mix.ar(snd * 0.3)));
snd = FreeVerb.ar(snd, 0.5, 0.2);
}).play;
)

(//denial
Ndef(\greef).fadeTime = 8;
Ndef(\greef, {
var snd, snda, sndb, osc, env, freq;

    freq = 600;
    env = Env.perc(0.001, 3).ar;
    osc = SinOsc.ar(
		freq: freq,
        mul: env);

	snda = PitchShift.ar(osc, 0.2, LFNoise1.ar(0.75).range(1/2, 4), 0, LFNoise1.ar(0.75).range(0, 0.5), 3);

	snda = CombN.ar(snda, 5, LFNoise0.ar(0.5).range(1, 3), inf);

	snd = LeakDC.ar(snda);
    snd = snd.tanh;
}).play;
)

(//Mouse Denial
Ndef(\greef).fadeTime = 1;
Ndef(\greef, {
	var snd = LFTri.ar(
		freq: 43 * [LFNoise0.ar(5).range(1, 16).round(1), LFNoise0.ar(7).range(1, 16).round(1)],
		mul: Slew.ar(Saw.ar(3), 1000, 1000);
	);
	snd = LPF.ar(snd, MouseX.kr(150, 9600));
	snd = snd * Slew.ar(LFPulse.ar(6, 0, 0.15), 10000, 10000);
	snd = Mix.ar(snd);
	snd = CombC.ar(snd, 0.1, 0.1, 3);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh);
	snd = SinOsc.ar(0, (snd  * MouseY.kr(0.1, 16) * pi).mod(2pi));
	snd = Limiter.ar(snd);
}).play;
)

(//bargain bells
Ndef(\greef).fadeTime = 2;
Ndef(\greef, {
	var snd, freq, env;

	//snd = LFPulse.ar([60, 60 * 2.pow(LFNoise0.ar(6).range(1, 16)/12), 60 * 2.pow(11/13)] * [6, 17] * 1);
	snd = LFPulse.ar([60, 60 * 2.pow(LFNoise0.ar(6).range(1, 16)/12)] * 18);
	snd = RLPF.ar(snd, LFNoise0.ar(12).range(120, 2400), 0.15, Slew.ar(LFClipNoise.ar(3), 100, 100));
	snd = CombN.ar(snd, 0.5, 0.5, -5);

	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh) * 10;
	env = Env.perc(attackTime: 0.1, releaseTime: 5, curve: 0).ar;
	snd = CombN.ar(snd * env, 0.5, 0.5, -5);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)



(//angery
Ndef(\xorCtrlA, {
Slew.ar(LFNoise0.ar(3).range(0, 1), 8, 8)
});

Ndef(\xorCtrlB, {
Slew.ar(LFNoise0.ar(5).range(0, 1), 8, 8)
});

Ndef(\xorCtrlC, {
LFClipNoise.ar(25).range(0, 1)
});

Ndef(\greef).fadeTime = 0;
Ndef(\greef, {
var snda, sndb, snd;

snda = LFPulse.ar(LinExp.ar(Ndef(\xorCtrlA), 0, 1, 40, 800)).range(0, 1);
snda = LFPulse.ar(MouseX.kr(40, 800)).range(0, 1);

sndb = LFPulse.ar(LinExp.ar(Ndef(\xorCtrlB), 0, 1, 40, 800)).range(0, 1);
sndb = LFPulse.ar(MouseY.kr(40, 800)).range(0, 1);

snd = (snda * sndb) + ((1 - snda) * (1 - sndb));
snd = snd * Ndef(\xorCtrlC) * 0.25;

snd = snd + DelayN.ar(snd, 0.6, 0.6) + DelayN.ar(snd, 0.5, 0.5);
snd = snd * DelayN.ar(Ndef(\xorCtrlC), 0.33, 0.33);
}).play;
)

(//angery backup
Ndef(\greef).fadeTime = 0;
Ndef(\greef, {
	var env = LFPulse.ar(
		freq: 6,
		width: SinOsc.ar(1/3).range(0.1, 0.5)
	);
	var snd = LFPulse.ar(200).range(0, 1) * LFPulse.ar(340).range(0, 1);
	snd = (1 - snd ) * LFPulse.ar(767).range(0, 1);
	//snd = LFClipNoise.ar([200, 340, 767]);
	snd = HPF.ar(
		in: snd,
		freq: SinOsc.ar(1/3).range(15000, 960000),
		mul: 0.3
	);
	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh * snd.tanh * snd.tanh) * 10;
	snd = snd * env;
	snd = Mix.ar(snd);
	snd = FreeVerb.ar(snd, 0.3, 0.5);
	snd = LPF.ar(snd, 360);
	snd = Limiter.ar(snd * 0.1);
}).play;
)
