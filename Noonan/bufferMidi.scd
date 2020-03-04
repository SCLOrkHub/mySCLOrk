MIDIIn.connectAll;
// MIDIClient.init;
b = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
c = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
d = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");
e = Buffer.read(s, "/home/sclork/Downloads/wheels-mono.wav");

var samples = [b, c, d, e];
(
// A SynthDef with ADSR envelope
SynthDef("quick2", {arg freq = 440, amp = 0.1, gate = 1, sample;
	var snd;

	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: 1,
		trigger: Impulse.kr(20),
		startPos: 0.5 * BufSamples.kr(b),
		loop: 1
	);
	Out.ar(0, snd);
}).add;
)

// Play it with a MIDI keyboard
(
var noteArray = Array.newClear(128); // array has one slot per possible MIDI note

MIDIdef.noteOn(\myKeyDown, {arg vel, note;
	noteArray[note] = Synth("quick2", [\sample, samples[note]]);
	["NOTE ON", note].postln;
});

MIDIdef.noteOff(\myKeyUp, {arg vel, note;
	noteArray[note].set(\gate, 0);
	["NOTE OFF", note].postln;
});
)
// PS. Make sure SC MIDI connections are made (MIDIIn.connectAll)


// ++ code copied from aastha
x = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Noonan/good_enough.wav");

// -- end of copied code
[x, 0.99, 0.2, 4, 1.1, 0.2, 1, 0, 0.2, 2]
// ++ code copied from aastha
(
SynthDef("good enough", { arg sample;
	var dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: x,
		rate: BufRateScale.kr(x) * 0.99,
		trigger: Impulse.kr(0),
		startPos: 0.2 * BufSamples.kr(x),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: 4
	);
	snd = (dry * 1.1) + (wet * 0.2);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: 1,
		delaytime: LFSaw.ar(0, 0.2), // < play with this number
		decaytime: 2 // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
	Out.ar(0, snd);
}).play;
)
// -- end of copied code
