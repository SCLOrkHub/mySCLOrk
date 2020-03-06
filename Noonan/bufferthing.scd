(
var samples = Array.newClear(3);
x = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Noonan/good_enough.wav");

samples = [
	[r, 0.988, 0.0, 4, 1.1, 3, 1, 0.1, 0.1, 2],
	[u, 1, 0.1, 4, 1.1, 0.01, 1, 0.2, 0.2, 1],
	[x, 0.99, 0.2, 4, 1.1, 0.2, 1, 0, 0.2, 2]
];



var noteArray = Array.newClear(128); // array has one slot per possible MIDI note

MIDIdef.noteOn(\myKeyDown, { arg note;
	noteArray[note] = Synth("samples", [\sample, samples[note][0], \bufRate, samples[note][1], \startPos, samples[note][2], \rt60, samples[note][3], \dryRat, samples[note][4], \wetRat, samples[note][5], \maxDel, samples[note][6], \delMin, samples[note][7], \delMax, samples[note][8], \dec, samples[note][9]]);
	["NOTE ON", note].postln;
});

MIDIdef.noteOff(\myKeyUp, { arg note;
	noteArray[note].set(\gate, 0);
	["NOTE OFF", note].postln;
});
)



SynthDef("samples", { arg sample, bufRate, startPos, rt60, dryRat, wetRat, maxDel, delMin, delMax, dec;
	var dry, wet, snd;
	dry = PlayBuf.ar(
		numChannels: 1,
		bufnum: sample,
		rate: BufRateScale.kr(sample) * bufRate,
		trigger: Impulse.kr(0),
		startPos: startPos * BufSamples.kr(sample),
		loop: 1
	);
	wet = NHHall.ar(
		in: dry!2,
		rt60: rt60
	);
	snd = (dry * dryRat) + (wet * wetRat);
	snd = snd + CombC.ar(
		in: snd,

		maxdelaytime: maxDel,
		delaytime: LFSaw.ar(delMin, delMax), // < play with this number
		decaytime: dec // < and this number
	);
	snd = Limiter.ar(Mix.ar(snd));
	Out.ar(0, snd);
}).play;
)