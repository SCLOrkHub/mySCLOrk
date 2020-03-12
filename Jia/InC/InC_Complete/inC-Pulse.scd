// Stuff needed only to begin playing:
Pbindef.clear;
// ~clock = TempoClock.new(2).permanent_(true); // if not using a shared clock
~mySynth = "default"; // choose a synth here


(
Pbindef(\pPulse,
	\instrument, ~mySynth,
    \degree, 14,
    \dur, 1/2,
    \amp, 0.3,
    \legato, 0.3
).play(~clock, quant: 1).quant = 1;
)