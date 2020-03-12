SCLOrkChat("Harrison");

Pbindef(\46,
	\instrument, "playBuf",
	\dur, Pseq([1, Rest(1), 8/16, 3/16, 1/2, Rest(7/8), 5/8, 1/2, Rest(1/2), Rest(1), 1, Rest(1) ], inf),
	\bufnum, ~samples[11],
	\amp, 0.25,
	\rate, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\46,
	\instrument, "playBuf",
	\dur, Pseq([8/16, 8/16, 8/16, 8/16, 8/16,1/4 ,1/4 , 1/2, 1], inf),
	\bufnum, ~samples[11],
	\amp, 0.3,
	\rate, 1/2
).play(~clock, quant: 4).quant = 4;



Pbindef(\47,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 1, 1], inf),
	\bufnum, ~samples[10],
	\amp, 0.4,
	\rate, 4
).play(~clock, quant: 4).quant = 4;

Pbindef(\47,
	\instrument, "playBuf",
	\dur, Pseq([1, Rest (1), 0.5, 0.25, 1], inf),
	Pshuf([Rest(0.5), 0.25, 0.25, Rest(0.5), 0.5, Rest(0.5), 0.5], 1)
	], inf),
	\bufnum, ~samples[10],
	\amp, 0.4,
	\rate, 4
).play(~clock, quant: 4).quant = 4;