

// ++ code copied from tanya
(
Ndef(\boing2).fadeTime = 3;
Ndef(\boing2, {
	var snd = Clip.ar(
		in: Pulse.ar(freq: 50, width: 0.95),
		lo: 0,
		hi: 1
	);
	/*
	snd = PMOsc.ar(
		carfreq: 20, // 2000
		modfreq: LFNoise0.kr(1/4).range(190, 200),
		pmindex: MouseX.kr(1, 4),
		mul: snd * LFTri.ar(11)
	);
	*/
	snd = RLPF.ar(
		in: snd,
		freq: Pulse.ar(1/2).range(1000, 1630),
		rq: 0.4
	);
	snd = snd * LFNoise1.ar(
		freq: MouseY.kr(1, 8).round(1)
	);
	snd = snd.distort.distort.distort;
	snd = NHHall.ar(
		in: [snd, snd]
	);
	snd = Mix.ar(snd);
}).play
)

Ndef(\boing2).clear(60);
// -- end of copied code
