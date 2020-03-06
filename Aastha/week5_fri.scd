// Connect SCLOrkQuNeo
q = SCLOrkQuNeo.new

// Turn on the MIDI button on the graphical interface.
// Make sure you are in QuNeo preset #3.

// Here's a simple synth for this example (run it with server on)
/*(
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
)*/



(
SynthDef("goodenough", {
	arg dry, wet, snd;
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
}).add;
)



// Assign functions to QuNeo buttons:
(
var noteArray = Array.newClear(127); // array to store references to each note

q.onButtonChange = { |velocity, midinote|
	// if velocity is greater than zero start note; else, stop corresponding note.
	if(velocity>0, {
		noteArray[midinote] = Ndef("goodenough", [
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

(
q.onButtonChange = { | velocity, midinote |
	var synth;

	switch(midinote,

		// =========
		// OBJECT 1 - PITCH VAR
		// =========
		36, {
			if(velocity>0, {
				Synth("goodenough",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 2 - LOOPING PITCH VAR
		// =========
		37, {
			if(velocity>0, {
				{
					Synth("Object2",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[2]
						],
						target: ~objects[midinote]);
					// in the original toccata, user would push button a second time to stop recording and start looping 1-sec buffer.
					// here I chose to allow a fixed amount of time until recording stops and looping begins.
					// [note for future: might consider using velocity to define how long to wait until loop begins]
					"recording into buffer #2...".postln;
					5.wait;
					"now looping fx 37 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(4);
			});
			},
		// =========
		// OBJECT 3 - SPAWNING PITCH VAR
		// =========
		38, {
			if(velocity>0, {
				{
					var repeats = velocity.linlin(0, 127, 1, 5);
					("spawning fx #38 " ++ repeats ++ " times...").postln;
					repeats.do({
						Synth("Object3",
							[
								\in, ~micBus,
								\out, ~fxBus,
								\buffer, ~recBuffer[3],
								\pitchDispersion, rrand(0.0, 2.0)
							],
							target: ~objects[midinote]);
						rrand(1, 4).wait;
					});
					"now looping fx 38 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(7);
			});
			},
		// =========
		// OBJECT 4 - GRAINY SOUND
		// =========
		39, {
			if(velocity>0, {
				Synth("Object4",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 5 - MECHANICAL POPCORN
		// =========
		40, {
			if(velocity>0, {
				{
					Synth("Object5",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[5]
						],
						target: ~objects[midinote]);
					"recording into fx 40 buffer...".postln;
					5.wait;
					"now looping fx 40 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(15);
			});
			},
		// =========
		// OBJECT 6 - MECHANICAL PHRASER
		// =========
		41, {
			if(velocity>0, {
				{
					Synth("Object6",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[6]
						],
						target: ~objects[midinote]);
					"recording into fx 41 buffer...".postln;
					5.wait;
					"now looping fx 41 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(18);
			});
			},
		// =========
		// OBJECT 7 - DRASTIC PITCH MOD
		// =========
		42, {
			if(velocity>0, {
				Synth("Object7",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(6);
			});
		},
		// =========
		// OBJECT 8 - FOR LONG TONE
		// =========
		43, {
			if(velocity>0, {
				Synth("Object8",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(5);
			});
		},
		// =========
		// OBJECT 9 - LOOPING REVERSE
		// =========
		44, {
			if(velocity>0, {
				{
					Synth("Object9",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[9]
						],
						target: ~objects[midinote]);
					"recording into fx 44 buffer...".postln;
					5.wait;
					"now looping fx 44 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(8);
			});
			},
		// =========
		// OBJECT 10 - LOOPING PITCH VAR 2
		// =========
		45, {
			if(velocity>0, {
				{
					Synth("Object10",
						[
							\in, ~micBus,
							\out, ~fxBus,
							\buffer, ~recBuffer[10]
						],
						target: ~objects[midinote]);
					"recording into fx 45 buffer...".postln;
					5.wait;
					"now looping fx 45 buffer".postln;
					~objects[midinote].set(\rec, 0);
				}.fork;
			}, {
				~objects[midinote].release(4);
			});
			},
		// =========
		// OBJECT 11 - GRAINY SOUND HIGH
		// =========
		46, {
			if(velocity>0, {
				Synth("Object11",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(7);
			});
		},
		// =========
		// OBJECT 12 - GRAINY SOUND LOW
		// =========
		47, {
			if(velocity>0, {
				Synth("Object12",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(5);
			});
		},
		// =========
		// OBJECT 13 - PITCH MODULATION
		// =========
		48, {
			if(velocity>0, {
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 14 -
		// =========
		49, {
			if(velocity>0, {
				/*
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
				*/
			}, {
				// ~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 15 -
		// =========
		50, {
			if(velocity>0, {
				/*
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
				*/
			}, {
				// ~objects[midinote].release(2);
			});
		},
		// =========
		// OBJECT 16 -
		// =========
		51, {
			if(velocity>0, {
				/*
				Synth("Object13",
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
				*/
			}, {
				// ~objects[midinote].release(2);
			});
		}
	);

};

q.changeButtonLabel(36, "\nPITCH\nVARIATION");
q.changeButtonLabel(37, "\nLOOPING \nPITCH VAR");
q.changeButtonLabel(38, "\nSPAWNING \nPITCH VAR");
q.changeButtonLabel(39, "\nGRAINY\nSOUND");
q.changeButtonLabel(40, "\nMECHANICAL\nPOPCORN");
q.changeButtonLabel(41, "\nMECHANICAL\nPHRASER");
q.changeButtonLabel(42, "\nDRASTIC\nPICTH MOD");
q.changeButtonLabel(43, "\nFOR LONG TONES");
q.changeButtonLabel(44, "\nLOOPING\nREVERSE");
q.changeButtonLabel(45, "\nLOOPING\nPITCH VAR 2");
q.changeButtonLabel(46, "\nGRAINY\nHIGH");
q.changeButtonLabel(47, "\nGRAINY\nLOW");
q.changeButtonLabel(48, "\nPITCH\nMODULATION");
// q.changeButtonLabel(49, "empty");
// q.changeButtonLabel(50, "empty");
// q.changeButtonLabel(51, "empty");

q.onSliderChange = { |value, sliderNum|
	switch(sliderNum,
		6, {~mixerSynth.set(\directMicLevel, value)},
		7, {~mixerSynth.set(\reverbAmount, value)},
		8, {~mixerSynth.set(\fxLevel, value)},
		9, {~mixerSynth.set(\masterVolume, value)},
		10, {"test"}
	);
};

q.changeSliderLabel(6, "dry\nout", false);
q.changeSliderLabel(7, "wet\nout", false);
q.changeSliderLabel(8, "fx\nout", false);
q.changeSliderLabel(9, "master\nvol", false);

8

);







	/*
	// Object 1 example
	(
	~o1 = Synth(
	defName: "Object1",
	args: [\in, ~micBus, \out, ~fxBus],
	target: ~effects
	);
	)
	~o1.release;

	~mixerSynth.set(\directMicLevel, 1.0);
	~mixerSynth.set(\fxLevel, 1.0);
	~mixerSynth.set(\reverbAmount, 1.0);
	~mixerSynth.set(\masterVolume, 1.0);
	~mixerSynth.free;


	// UPON ENDING THE PIECE

	s.freeAll;
	*/