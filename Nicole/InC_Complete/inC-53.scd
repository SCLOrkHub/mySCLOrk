// ORIGINAL (do not live code on this one)
(
Pbindef(\p52).stop;
Pbindef(\p53,
	\instrument, ~mySynth,
    \degree, Pseq([6b, 4], inf),
    \dur, Pseq([1/4], inf),
	\amp, Pseq([0.7, 0.5], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p52).stop;
Pbindef(\p53,
	\instrument, ~mySynth,
    \degree, Pseq([-6b, -14], inf),
    \dur, Pseq([1/4], inf),
	\amp, Pseq([0.7, 0.5], inf),
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)


// END OF PIECE



// WARNING: this will close all docs, but NOT save any changes (which may be what you want?)
Document.closeAll;