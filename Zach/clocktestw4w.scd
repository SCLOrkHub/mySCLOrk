

// ++ code copied from tan
(
OSCdef(\startClock, { |msg|
	msg.postln;
	// turn it on at bpm
	if(msg[1]==\on, {
		~clock = TempoClock.new(msg[2]/60).permanent_(true)
	});
	// turn it off
	if(msg[1]==\off, { ~clock.stop });
	// change tempo
	if(msg[1]==\change, { ~clock.tempo = msg[2]/60 })
},
path: 'metronome'
).permanent_(true);
)
// -- end of copied code




// ++ code copied from bruno
// ===================================
// Frequency Modulation example
// (make sure you have a working ~clock running)
// ===================================

(
SynthDef("FM-env", {arg freq = 440, cmRatio = 3, modIndex = 0, amp = 0.01, att = 0.01, dec = 0.05, sus = 0.9, rel = 0.1, pan = 0, gate = 1;
	var carrier, modulator, modFreq, freqDev, snd, env;
	env = Env.adsr(
		attackTime: att,
		decayTime: dec,
		sustainLevel: sus,
		releaseTime: rel,
		peakLevel: amp
	).kr(gate: gate);

	// modIndex always ramps down to 1 over attack duration
	modIndex = Line.kr(modIndex, 1, att*2);

	modFreq = freq * cmRatio.reciprocal;
	freqDev = modIndex * modFreq;

	modulator = SinOsc.ar(freq: modFreq, mul: freqDev);
	carrier = SinOsc.ar(freq: freq + modulator);
	snd = carrier * env;
	snd = Pan2.ar(snd, pan);
	Out.ar(0, snd);
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)



// wobble base
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 0, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 70, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(-4, 40), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.8], inf),
	\att, 0.8,
	\dec, Pkey(\dur) * 0.5, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 7.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code








// ++ code copied from sam
//squeecky wobble
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([1, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 4, 5, 6], inf),
	\mtranspose, 0, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 100.5, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, Pwhite(500, 1000), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 1.0,
	\dec, Pkey(\dur) * 3, // decay calculated as ratio of note duration
	\sus, 0.6,
	\rel, Pwhite(4, 2.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code




// ++ code copied from bruno
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([
		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 2, 4, 6, 8], inf),
	\mtranspose, 12, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 2, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, 1, Pwhite(5, 10), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, 0.1, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(4, 700.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code





// ++ code copied from bruno
(
Pbindef(\clouds,
    \instrument, "FM-env",
	\dur, Pseq([

		2,
		Prand([3, Rest(1)], 3)
	], inf),
	\degree, Prand([0, 2, 4, 6, 8], inf),
	\mtranspose, 12, //Prand([-5, 0, 5, 6], inf),
	\cmRatio, 2, // integer numbers, harmonic tones; non-intenegers, inharmonic
	\modIndex, 1, Pwhite(3, 5), // higher numbers, richer sound
	\amp, Prand([0.1, 0.2, 0.041, 0.05], inf),
	\att, 0.8,
	\dec, 0.1, // decay calculated as ratio of note duration
	\sus, 0.1,
	\rel, Pwhite(14, 17.0)
).play(~clock, quant: 1).quant = 1; // quantize it to the beat
)
// -- end of copied code
