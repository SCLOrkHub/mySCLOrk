

(
~bufs = Array.newClear(100);
"/home/sclork/Music/TR808/*.flac".resolveRelative.pathMatch.do({ |path, i|
	~bufs[i] = Buffer.read(s, path);
});
)

~bufs[14].play;
(
Ndef(\tr, {
	var snd;
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: ~bufs[2..4],
		rate: [1, 0.5, 2] * LFNoise0.kr(1).range(1, 2), //[1, 1.1, 0.9],
		trigger: Impulse.ar(MouseX.kr(1, 10)),
		startPos: 0,
		loop: 0
	);
	snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.12,
		decaytime: 5
	);
	snd = snd * LFPulse.ar(1/6, width: 0.1);
	// snd = NHHall.ar([snd, snd], rt60: 0.3);
	snd = Mix.ar(snd);

}).play;
)

Ndef(\tr).clear(30)
