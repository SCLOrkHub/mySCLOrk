(
Ndef(\dorian2, {
	var snd, freq, env, trig, gate, array;

	trig = Dust.kr(0.5, 2, -1) * LocalIn.ar;
	trig = Env.linen(0, 1/3.5, 0).ar(doneAction: 0, gate: trig);
	env = Env.perc(0.001, 3, 0.5, -4).ar(doneAction: 0, gate: trig);

	LocalOut.ar(1 - trig);

	array = [16, 19, 21, 24, 29, 32];
	//array = [2.pow(0), 2.pow(2/12), 2.pow(3/12), 2.pow(5/12), 2.pow(7/12), 2.pow(9/12), 2.pow(10/12), 2.pow(1)];

	freq = TChoose.kr(trig, array);
	freq = freq/16;
	snd = SinOsc.ar(240 * freq, 0, env);
	snd = (CombN.ar(snd, 0.5, 0.5, 5) * LFNoise2.ar(3).range(0.25, 0.5)) + (CombN.ar(snd, 0.75, 0.75, 5) * LFNoise2.ar(3).range(0.25, 0.5));
	snd = LPF.ar(snd.softclip, 360);
}).play;
)

(
Ndef( \barber, {
	var snd, snda, sndb, sndc, sndd, snde, sndf, sndg, sndh, env, lfoa, lfob, lfoc, lfod, lfoe, lfof, lfog, lfoh, rate, lo, hi, fb;

	hi = 0.02051;
	lo =  0.0001;
	fb = -100;

	env = 0.3;//MouseX.kr(0, 0.5);
	rate = 0.005;
	snd = LFPulse.ar(freq: 60, mul: env);

	lfoa = LFSaw.ar(freq: rate, iphase: 0).range(0, 1);
	lfoa = LinExp.ar(in: lfoa, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfob = LFSaw.ar(freq: rate, iphase: 0.25).range(0, 1);
	lfob = LinExp.ar(in: lfob, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfoc = LFSaw.ar(freq: rate, iphase: 0.5).range(0.005, 0.03);
	lfoc = LinExp.ar(in: lfoc, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfod = LFSaw.ar(freq: rate, iphase: 0.75).range(0, 1);
	lfod = LinExp.ar(in: lfod, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfoe = LFSaw.ar(freq: rate, iphase: 1).range(0, 1);
	lfoe = LinExp.ar(in: lfoe, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfof = LFSaw.ar(freq: rate, iphase: 1.25).range(0, 1);
	lfof = LinExp.ar(in: lfof, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfog = LFSaw.ar(freq: rate, iphase: 1.5).range(0, 1);
	lfog = LinExp.ar(in: lfog, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	lfoh = LFSaw.ar(freq: rate, iphase: 1.75).range(0, 1);
	lfoh = LinExp.ar(in: lfoh, srclo: 0, srchi: 1, dstlo: lo, dsthi: hi);

	snda = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfoa, decaytime: fb);
	//snda = SinOsc.ar(freq: lfoa * 100000);
	snda = snda * SinOsc.ar(rate, phase: 2pi/4).range(0, 1);

	sndb = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfob, decaytime: fb);
	//sndb = SinOsc.ar(freq: lfob * 100000);
	sndb = sndb * SinOsc.ar(rate, phase: 3pi/4).range(0, 1);

	sndc = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfoc, decaytime: fb);
    //sndc = SinOsc.ar(freq: lfoc * 100000);
	sndc = sndc * SinOsc.ar(rate, phase: 4pi/4).range(0, 1);

	sndd = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfod, decaytime: fb);
	//sndd = SinOsc.ar(freq: lfod * 100000);
	sndd = sndd * SinOsc.ar(rate, phase: 5pi/4).range(0, 1);

	snde = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfoe, decaytime: fb);
	//snde = SinOsc.ar(freq: lfoe * 100000);
	snde = snde * SinOsc.ar(rate, phase: 6pi/4).range(0, 1);

	sndf = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfof, decaytime: fb);
	//sndf = SinOsc.ar(freq: lfof * 100000);
	sndf = sndf * SinOsc.ar(rate, phase: 7pi/4).range(0, 1);

	sndg = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfog, decaytime: fb);
	//sndg = SinOsc.ar(freq: lfog * 100000);
	sndg = sndg * SinOsc.ar(rate, phase: 0).range(0, 1);

	sndh = CombC.ar(in: snd, maxdelaytime: 0.1, delaytime: lfoh, decaytime: fb);
	//sndh = SinOsc.ar(freq: lfoh * 100000);
	sndh = sndh * SinOsc.ar(rate, phase: pi/4).range(0, 1);

	snd = LeakDC.ar(Limiter.ar(Mix.ar([snda, sndb, sndc, sndd, snde, sndf, sndg, sndh])));
}).play;
)

{LFSaw.ar.range(0, 1) * SinOsc.ar(phase: pi/2).range(0, 1)}.plot;
{SinOsc.ar.clip(-1, 1).pow(2)}.plot;
{ SinOsc.ar(20, [0, pi/2, pi]) }.plot(0.1)
1/0.001

SCLOrkChat.new("josh")

// ++ code copied from nil
(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2];

	freq = (50 * harmonics) * [1];


	snd = SinOscFB.ar(freq: freq, feedback: MouseX.kr(0, 1.6), mul: SinOsc.ar(10).range(0, 1));


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
