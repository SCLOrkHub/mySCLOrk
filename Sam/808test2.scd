

// ++ code copied from luken
(
SynthDef.new(\samp, { |buf, amp, out, ffreq|
	var snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf), doneAction: 2);
	/*snd = CombC.ar(
		in: snd,
		maxdelaytime: 1,
		delaytime: 0.2,
		decaytime: 2
	);*/
	snd = HPF.ar(snd, ffreq);
	Out.ar(out, snd*amp);
}).add;
)

~clock = TempoClock.new;
~clock.tempo = 100 / 60;
(
Pbindef(\beat,
	\instrument, \samp,
	\dur, 1/8, //Pseq([1/4, 1/4, Pn(1/2, 2), Rest(1/4)], inf),
	\amp, Pwhite(0.4, 1),
	\buf, Pseq([
		~bufs[1], ~bufs[10], ~bufs[10], ~bufs[10],
		~bufs[5], ~bufs[14], ~bufs[5], ~bufs[10],
		~bufs[10], ~bufs[0], ~bufs[10], ~bufs[0],
		~bufs[10], ~bufs[6], ~bufs[11], ~bufs[0],
		~bufs[10], ~bufs[0], ~bufs[11], ~bufs[0],
	], inf),
	\ffreq, Pwhite(4000, 5230)
).play(~clock);
)
// -- end of copied code
