SCLOrkChat.new("jiji");

(
Pbindef(\faster,
	\instrument, "harpsy",
	\dur, 1/8,
	\amp, Prand([0, 0.5], inf),
	\degree, Prand([0, 1, 2, 3, 4, 5, 6], inf), // << quickie way to transpose pitch, just add a number
	\mtranspose, 14,
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)

Pbindef(\faster).stop;


// ++ code copied from bruno
(
Pbindef(\melody1, // << this is the NAME of this unique Pbindef
	\instrument, "harpsy",
	\dur, 1/8,
	\amp, Prand([0, 0, 0.5], inf),
	\degree, Pwhite(0, 10),
	\mtranspose, 14,
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;
)
// -- end of copied code
