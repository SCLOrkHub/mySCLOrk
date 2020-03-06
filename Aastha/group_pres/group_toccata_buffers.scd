
// Toccata V3
// Button Actions
// ===========================
(
b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/children-laughing1.wav");
g = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/goodnight2.wav");
h = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/highlaughing.wav");
l = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/lowlaughing.wav");
a = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/alarm.wav");
r = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/ring2.wav");
u = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/i hate u.wav");
m = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/midtermq.wav");
o = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/money.wav");
x = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Aastha/good_enough.wav");

)

q = SCLOrkQuNeo.new.preset(\toggle); // run this

// ===============
// BUTTON ACTIONS & LABELS
// ===============

(
q.onButtonChange = { | velocity, midinote |
	var synth;

	switch(midinote,

		36, {
			if(velocity>0, {
				(
					Ndef(\childrenlaugh, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: b,
							rate: BufRateScale.kr(b),
							trigger: Impulse.kr(0),
							startPos: 0.2 * BufSamples.kr(b),
							loop: 1
						);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.0) + (wet * 0.3);
						snd = snd + CombC.ar(
							in: snd,
							maxdelaytime: 1,
							delaytime: 0.7, // < play with this number
							decaytime: 1 // < and this number
						);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			},

			{
				Ndef(\childrenlaugh).clear(30);
			});
		},

		37, {
			if(velocity>0, {
				(
					Ndef(\goodnight, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: g,
							rate: BufRateScale.kr(g),
							trigger: Impulse.kr(0),
							startPos: 0.2 * BufSamples.kr(g),
							loop: 1
						);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.0) + (wet * 0.3);
						snd = snd + CombC.ar(
							in: snd,
							maxdelaytime: 1,
							delaytime: 0.5, // < play with this number
							decaytime: 5 // < and this number
						);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			}, {
				Ndef(\goodnight).clear(30);
			});
			},

		38, {
			if(velocity>0, {
				(
					Ndef(\laugh1, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: h,
							rate: BufRateScale.kr(h) * MouseX.kr(1,2),
							trigger: Impulse.kr(0),
							startPos: 0.2 * BufSamples.kr(h),
							loop: 1);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.0) + (wet * 1.0);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			}, {
				Ndef(\laugh1).clear(20);
			});
			},

		39, {
			if(velocity>0, {
				(
					Ndef(\laugh2, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: l,
							rate: BufRateScale.kr(l) * MouseX.kr(1,2) * 1.2,
							trigger: Impulse.kr(0),
							startPos: 0.2 * BufSamples.kr(l),
							loop: 1);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.0) + (wet * 1.0);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			},
			{
				Ndef(\laugh2).clear(20);
			});
		},

		40, {
			if(velocity>0, {
				(
					Ndef(\good_enough, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: x,
							rate: BufRateScale.kr(x) * 0.99,
							trigger: Impulse.kr(0),
							startPos: 0.2 * BufSamples.kr(x),
							loop: 0
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
					}).play;
				)
			}, {
				Ndef(\good_enough).clear(3);
			});
			},

		41, {
			if(velocity>0, {
				(
					Ndef(\ihateyou, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: u,
							rate: BufRateScale.kr(u),
							trigger: Impulse.kr(0),
							startPos: 0.1 * BufSamples.kr(u),
							loop: 0
						);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.1) + (wet * 0.01);
						snd = snd + CombC.ar(
							in: snd,

							maxdelaytime: 1,
							delaytime: 0.2, // < play with this number
							decaytime: 1 // < and this number
						);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			}, {
				Ndef(\ihateyou).clear(3);
			});
			},

		42, {
			if(velocity>0, {
				(
					Ndef(\ringaroundtherosies, {
						arg dry, wet, snd;
						dry = PlayBuf.ar(
							numChannels: 1,
							bufnum: r,
							rate: BufRateScale.kr(r) * 0.988,
							trigger: Impulse.kr(0),
							startPos: 0.0 * BufSamples.kr(r),
							loop: 1);
						wet = NHHall.ar(
							in: dry!2,
							rt60: 4
						);
						snd = (dry * 1.1) + (wet * 3);
						snd = snd + CombC.ar(
							in: snd,

							maxdelaytime: 1,
							delaytime: 0.1, // < play with this number
							decaytime: 2 // < and this number
						);
						snd = Limiter.ar(Mix.ar(snd));
					}).play;
				)
			}, {
				Ndef(\ringaroundtherosies).clear(20);
			});
		},
		// =========
		// OBJECT 8 - FOR LONG TONE
		// =========
		43, {
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
		// OBJECT 9 - LOOPING REVERSE
		// =========
		44, {
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
		// OBJECT 10 - LOOPING PITCH VAR 2
		// =========
		45, {
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
		// OBJECT 11 - GRAINY SOUND HIGH
		// =========
		46, {
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
		// OBJECT 12 - GRAINY SOUND LOW
		// =========
		47, {
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
		// OBJECT 13 - PITCH MODULATION
		// =========
		48, {
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

q.changeButtonLabel(36, "\nCHILDREN'S \nLAUGHTER");
q.changeButtonLabel(37, "\nGOOD \nNIGHT");
q.changeButtonLabel(38, "\nLOW \nLAUGH");
q.changeButtonLabel(39, "\nHIGH\nLAUGH");
q.changeButtonLabel(40, "\nGOOD\nENOUGH");
q.changeButtonLabel(41, "\nI HATE\nYOU");
q.changeButtonLabel(42, "\nRING\nAROUND THE \nROSIES");
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

