
// boot server first
(
SynthDef("harpsichord1", { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
	env = Env.perc(releaseTime: 0.25, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq * [1, 0.999, 1.0001], 0.25, 0.75);
	snd = snd * env;
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;
)

// Listen for clock info from conductor
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


// Play your patterns on the clock:
(
Pbindef(\hh,
	\instrument, "harpsichord1",
	\dur, 1,
	\amp, 0.5,
	\degree, Pseq([3, 0, 1, 2], inf)
).play(~clock, quant: 4).quant = 4;
)