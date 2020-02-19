// Connect SCLOrkQuNeo
q = SCLOrkQuNeo.new

// Turn on the MIDI button on the graphical interface.
// Make sure you are in QuNeo preset #3.

// Here's a simple synth for this example (run it with server on)
(
SynthDef("quick2", {arg freq = 440, amp = 0.1, att = 0.01, rel = 1, gate = 1;
	var snd, env;
	env = Env.adsr(
		attackTime: att,
		decayTime: 0.1,
		sustainLevel: 0.3,
		releaseTime: rel,
		peakLevel: amp
	).kr(2, gate);
	snd = Saw.ar(freq: freq * [1, 1.5, 1.01, 1.51], mul: env * [1, 0.1]);
	snd = LPF.ar(snd, SinOsc.ar(1/5).range(500, 15000));
	snd = Limiter.ar(Mix.ar(snd));
	Out.ar(0, snd)
}).add;
)

// Assign functions to QuNeo buttons:
(
var noteArray = Array.newClear(127); // array to store references to each note

q.onButtonChange = { |velocity, midinote|
	// if velocity is greater than zero start note; else, stop corresponding note.
	if(velocity>0, {
		noteArray[midinote] = Synth("quick2", [
			\freq, midinote.midicps,
			\amp, velocity.linlin(0, 127, 0, 1),
			\att, 0.01,
			\rel, 0.5
		]);
		["NOTE ON", midinote, velocity].postln;
	}, {
		noteArray[midinote].set(\gate, 0);
		["NOTE OFF", midinote].postln;
	});
};
)