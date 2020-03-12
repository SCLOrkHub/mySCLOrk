// Quick test:
b.play;
c.play;
f.play;
h.play;
r.play;


SCLOrkChat.new("bruno", true);

Ndef(\crix).clear(30);
(
Ndef(\crix).fadeTime = 1; // big crossfade time
Ndef(\crix, {
	var snd;
	var sample = c; // crickets sample

	snd = Ndef(\buf).ar;
	// snd = snd * XLine.kr(0.1, 0.5, 2);
	// snd = LPF.ar(snd, 1000);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.5, //MouseX.kr(0.15, 0.21),
		decaytime: 1
	);
	/*snd = snd + PitchShift.ar(
		in: snd,
		windowSize: 0.2,
		pitchRatio: XLine.kr(1, 1, 10) * MouseX.kr(1.0, 1),
		pitchDispersion: 0.1,
		timeDispersion: 0.1
	);*/
	snd = RHPF.ar(snd, ([60, 63, 69, 72] + Line.kr(24, -12, 40)).midicps, 0.0151);
	snd = snd * LFTri.ar([1/3, 1/6]);
	snd = NHHall.ar(Splay.ar(snd)) + snd;
	snd = Mix.ar(snd); // make sure it's mono

}).play;
)

(
Ndef(\buf, {
	var sample;
	sample = c;
	PlayBuf.ar(
		numChannels:  1,
		bufnum: sample,
		rate: LFNoise0.kr(1).range(0.85, 1.5) * BufRateScale.kr(sample),
		startPos: 0,
		loop:  1
	);
})
)