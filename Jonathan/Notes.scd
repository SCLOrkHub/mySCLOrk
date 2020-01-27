SCLOrkChat.new("Jon");
(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4], inf),
	\dur, Pwhite(1, 4)
).play;
)


(
Pbindef(\name,
	// \instrument, "bagpipe",
	\degree, Pseq([0, 1, 2, 3, 4], inf),
	\ctranspose, -12,
	\dur, Pwhite(1, 4),
	\amp, 0.2
).play
)

Pbindef(\name).stop;