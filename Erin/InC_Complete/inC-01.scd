// MAKE SURE YOU ARE RUNNING THE SHARED CLOCK FIRST!

// Boot server if it's not on already
s.boot;

// Load a few demo SynthDefs:
"inC-SynthDefs.scd".loadRelative;

// Clear old Pbindefs just in case::
Pbindef.clear;

// don't use this unless you doing tests by yourself:
// ~clock = TempoClock.new(2).permanent_(true);

// Pick one synth (run just one line of your choice):
~mySynth = "default";
~mySynth = "FMRhodes1";
~mySynth = "cheapPiano1";
~mySynth = "subBass2";
~mySynth = "acidOto3092";
~mySynth = "glockenspiel";
~mySynth = "organDonor";

// ORIGINAL (do not live code on this one)
(
Pbindef(\p1,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 0, 2, 0, 2], inf),
    \dur, Pseq([0.05, 0.95], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

// COPY (live code on THIS one instead)
(
Pbindef(\p1,
	\instrument, ~mySynth,
    \degree, Pseq([0, 2, 0, 2, 0, 2], inf),
    \dur, Pseq([0.05, 0.95], inf),
    \amp, 0.5,
    \legato, 1
).play(~clock, quant: 1).quant = 1;
)

