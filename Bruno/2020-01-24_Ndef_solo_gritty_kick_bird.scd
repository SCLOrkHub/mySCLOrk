Ndef(\freq, { SinOsc.ar(1/5).range(40, 82) + LFTri.ar(1/8).range(-2, 4) });

Ndef(\freq, { LFPulse.ar(1/5).range(90, 93) + LFTri.ar(6).range(-2, 4) });

Ndef(\freq, { LFTri.ar(5).range(40, 93) + LFTri.ar(6).range(-2, 4) });

Ndef(\wi, { SinOsc.ar(1/2).range(0.051, 0.12) });

(
Ndef(\s).fadeTime = 5;
Ndef(\s, {
	var snd, env;
	env = LFNoise2.ar(
		freq: [3, 5]
	).range(0.01, 0.5);
	env = env * SinOsc.ar(1/[1, 2, 4, 6, 8]).range(0, 1);
	snd = Pulse.ar(
		freq: Ndef(\freq).midicps.round([12, 9, 11, 10]),
		mul: LFPulse.ar(freq: [1, 5, 7, 2], width: Ndef(\wi).kr)
	);
	snd = snd * env;
	snd = snd + NHHall.ar(
		in: Splay.ar(snd) ,
		rt60: rrand(1, 2),
		stereo: 0.9
	);
	snd = SelectX.ar(MouseY.kr, [
		snd,
		BLowPass.ar(
			in: snd,
			freq: rrand(1500, 5000),
			rq: MouseX.kr(0.15, 0.26),
			mul: 0.5
		);
	]);
	snd = snd.distort;
	snd = Decimator.ar(snd, LFSaw.ar(1/4).range(12000, 23000), rrand(8, 16));
	snd = Limiter.ar(snd) / 2;
	snd = Mix.ar(snd)
}).play(fadeTime: 10);
)

Ndef(\s).clear(10)


(
Ndef(\b).fadeTime = 0;
Ndef(\b, {
	var snd, env;
	env = Pulse.ar(
		freq: 2
	).range(0.1, 0.5);
	env = env * Saw.ar([2, 1, 1, 1]).range(0.4, 1);
	snd = SinOsc.ar(
		freq: Ndef(\freq),
		mul: LFPulse.ar(freq: [1, 5, 7, 2], width: Ndef(\wi).kr)
	);
	snd = snd * env;
	snd = snd + NHHall.ar(
		in: Splay.ar(snd) / 3 ,
		rt60: rrand(1, 2),
		stereo: 0.9
	);
	snd = SelectX.ar(MouseY.kr, [
		snd,
		LPF.ar(
			in: snd,
			freq: rrand(1500, 2000),
			// rq: MouseX.kr(0.15, 0.26),
			mul: 0.5
		);
	]);
	snd = snd.distort;
	snd = Decimator.ar(snd, LFSaw.ar(1/4).range(2000, 13000), rrand(8, 9));
	snd = Limiter.ar(snd) / 2;
	snd = Mix.ar(snd)
}).play(fadeTime: 10);
)

Ndef(\b).clear(30);