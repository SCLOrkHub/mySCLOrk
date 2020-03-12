// Toccata V3
// Button Actions
// ===========================

(
b = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/WakeUp/children-laugh.wav");
h = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/WakeUp/bruno1.wav");
l = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/WakeUp/life.wav");
m = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/WakeUp/midterm.wav");
o = Buffer.read(s, "/home/sclork/Music/mySCLOrk/Jia/WakeUp/money.wav");
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
					(
						Ndef(\how, {
							arg dry, wet, snd;
							dry = PlayBuf.ar(
								numChannels: 1,
								bufnum: h,
								rate: BufRateScale.kr(h),
								trigger: Impulse.kr(0),
								startPos: 0 * BufSamples.kr(h),
								loop: 1
							);
							wet = NHHall.ar(
								in: dry!2,
								rt60: 4
							);
							snd = (dry * 1) + (wet * 0.3);
							snd = snd + CombC.ar(
								in: snd,
								maxdelaytime: 1,
								delaytime: 0, // < play with this number
								decaytime: 0 // < and this number
							);
							snd = Limiter.ar(Mix.ar(snd));
						}).play;
					)

				)
			}, {
				Ndef(\how).clear(10);
			});
			},

		38, {
			if(velocity>0, {
				(
					(
						Ndef(\midterm, {
							arg dry, wet, snd;
							dry = PlayBuf.ar(
								numChannels: 1,
								bufnum: m,
								rate: BufRateScale.kr(m) * 0.85,
								trigger: Impulse.kr(0),
								startPos: 0 * BufSamples.kr(m),
								loop: 1
							);
							wet = NHHall.ar(
								in: dry!2,
								rt60: 4
							);
							snd = (dry * 1) + (wet * 0.3);
							snd = snd + CombC.ar(
								in: snd,
								maxdelaytime: 1,
								delaytime: 0.01, // < play with this number
								decaytime: 0 // < and this number
							);
							snd = Limiter.ar(Mix.ar(snd));
						}).play;
					)
				)
			}, {
				Ndef(\midterm).clear(10);
			});
			},

		39, {
			if(velocity>0, {
				(
					(
						Ndef(\money, {
							arg dry, wet, snd;
							dry = PlayBuf.ar(
								numChannels: 1,
								bufnum: o,
								rate: BufRateScale.kr(o) * 0.99,
								trigger: Impulse.kr(0),
								startPos: 0.2 * BufSamples.kr(o),
								loop: 1);
							wet = NHHall.ar(
								in: dry!2,
								rt60: 4
							);
							snd = (dry * 1.1) + (wet * 0.2);
							snd = snd + CombC.ar(
								in: snd,

								maxdelaytime: 1,
								delaytime: 0.1, // < play with this number
								decaytime: 0 // < and this number
							);
							snd = Limiter.ar(Mix.ar(snd));
						}).play;
					)
				)
			},
			{
				Ndef(\money).clear(10);
			});
		},

		40, {
			if(velocity>0, {
				(
					(
						Ndef(\life, {
							arg dry, wet, snd;
							dry = PlayBuf.ar(
								numChannels: 1,
								bufnum: l,
								rate: BufRateScale.kr(l) * 1.15,
								trigger: Impulse.kr(0),
								startPos: 0 * BufSamples.kr(l),
								loop: 1
							);
							wet = NHHall.ar(
								in: dry!2,
								rt60: 4
							);
							snd = (dry * 1) + (wet * 0.2);
							snd = snd + CombC.ar(
								in: snd,
								maxdelaytime: 1,
								delaytime: 0.01, // < play with this number
								decaytime: 0 // < and this number
							);
							snd = Limiter.ar(Mix.ar(snd));
						}).play;
					)
				)
			}, {
				Ndef(\life).clear(10);
			});
			},

		41, {
			if(velocity>0, {
				(

				)
			}, {

			});
			},

		42, {
			if(velocity>0, {
				(

				)
			}, {

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
q.changeButtonLabel(37, "\nHOW \nBRUNO");
q.changeButtonLabel(38, "\nMIDTERM");
q.changeButtonLabel(39, "\nMONEY");
q.changeButtonLabel(40, "\nWHAT R U \nDOIN LIFE");
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




// -- end of copied code
