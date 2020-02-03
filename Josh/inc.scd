(
Pbindef(\p49).stop;
Pbindef(\p50,
	//\instrument, ~mySynth,
    \degree, Pseq([3, 4], inf),
    \dur, Pseq([1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p50).stop;
Pbindef(\p51,
	//\instrument, ~mySynth,
    \degree, Pseq([3, 4, 6b], inf),
    \dur, Pseq([1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p51).stop;
Pbindef(\p52,
	//\instrument, ~mySynth,
    \degree, Pseq([4, 6b], inf),
    \dur, Pseq([1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

(
Pbindef(\p52).stop;
Pbindef(\p53,
	//\instrument, ~mySynth,
    \degree, Pseq([6b, 4], inf),
    \dur, Pseq([1/4], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)