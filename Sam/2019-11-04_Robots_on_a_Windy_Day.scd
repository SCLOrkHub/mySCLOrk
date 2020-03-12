// robots on a windy day
(
Ndef(\boing2).fadeTime = 3;
Ndef(\boing2, {
	var snd = Clip.ar(
		in: Pulse.ar(freq: 100, iphase: 0, width: 0.15),
		lo: 0,
		hi: 1
	);
	snd = PMOsc.ar(
		carfreq: 2000,
		modfreq: LFNoise0.kr(1).range(190, 200),
		pmindex: MouseX.kr(1, 4),
		mul: snd * LFTri.ar(1)
	);
	snd = RLPF.ar(
		in: snd,
		freq: LFNoise2.ar(3).range(300, 630),
		rq: 0.01
	);
	snd = snd * LFNoise2.ar(
		freq: MouseY.kr(1, 13).round(1),
		width: 0.5
	);
	snd = NHHall.ar(
		in: [snd, snd]
	)
}).play
)