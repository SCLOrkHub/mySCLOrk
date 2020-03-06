// =======================
// SCLOrkQuNeo Drum Pad Example
// Example 2 - Using Patterns
// =======================

// Connect SCLOrkQuNeo
q = SCLOrkQuNeo.new

// ******************************************************
// Turn on the MIDI button on the graphical interface.
// Make sure you are in QuNeo preset #3.
// Switch to "toggle" mode in SCLOrkQuNeo (below the MIDI button)
// ******************************************************




// Boot server
s.boot;


// This demo uses the HardElectro1 drum kit.
// (the Pbindefs down below were designed with this kit in mind)
// There are two other drum kits in the folder that you can experiment with later.

(
~folder = "/home/sclork/Music/mySCLOrk/Zach/smallGroup/audio files for project";
// ~folder = "Audiophob";
// ~folder = "TR808EmulationKit";
// Load all sound files in that folder into Buffers
// NOTE: make sure your server is ON
~samples = (~folder ++ "/*").resolveRelative.pathMatch.collect({ |p| Buffer.readChannel(s, p, channels: [0]) });
)


// Quick test
// The variable ~samples now holds an Array that stores samples at numbered indices
~samples[0].play;
~samples[1].play;
~samples[2].play;
~samples[3].play; // dont use this one
~samples[4].play; // dont use this one
~samples[5].play; // use this one
~samples[6].play;
~samples[7].play;
~samples[8].play;
~samples[9].play;
~samples[10].play;
~samples[11].play;
~samples[12].play;
~samples[13].play;
~samples[14].play;
~samples[15].play;
~samples[16].play;
~samples[17].play;
~samples[18].play;
~samples[19].play;
~samples[20].play;
~samples[21].play;
~samples[22].play;
~samples[23].play;
~samples[24].play; // drum hit





~samples.size; // how many samples in this collection

// SynthDef to play with Patterns
(
SynthDef.new("playBuf", { arg bufnum, startPos = 0, amp = 0.5, gate = 1, rate = 1;
	var env, snd;
	env = Env.asr(
		attackTime: 0.001,
		sustainLevel: amp,
		releaseTime: 0.001
	).kr(doneAction: 2, gate: gate);
	// env = Env.perc(0.01, 0.5).kr(doneAction: 2, gate: gate);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: startPos * BufFrames.kr(bufnum);
		// pointer is a number between 0 and 1 (0=beginning of sample, 1=end of sample)
	);
	snd = snd * env;
	Out.ar(0, [snd, snd]);
}).add;
)

(
SynthDef.new("playBuf2", { arg bufnum, startPos = 0, amp = 0.5, gate = 1, rate = 1;
	var env, snd;
	env = Env.asr(
		attackTime: 0.00004,
		sustainLevel: amp,
		releaseTime: 1
	).kr(doneAction: 2, gate: gate);
	// env = Env.perc(0.01, 0.5).kr(doneAction: 2, gate: gate);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: startPos * BufFrames.kr(bufnum);
		// pointer is a number between 0 and 1 (0=beginning of sample, 1=end of sample)
	);
	snd = snd * env;
	Out.ar(0, [snd, snd]);
}).add;
)

(
SynthDef.new("playBuf3", { arg bufnum, startPos = 0, amp = 0.5, gate = 1, rate = 1;
	var env, snd;
	env = Env.asr(
		attackTime: 0.00004,
		sustainLevel: amp,
		releaseTime: 1

	).kr(doneAction: 2, gate: gate);
	// env = Env.perc(0.01, 0.5).kr(doneAction: 2, gate: gate);
	snd = PlayBuf.ar(
		numChannels: 1,
		bufnum: bufnum,
		rate: rate * BufRateScale.kr(bufnum),
		startPos: startPos * BufFrames.kr(bufnum);
		// pointer is a number between 0 and 1 (0=beginning of sample, 1=end of sample)
	);
	snd = snd * env;
	Out.ar(0, [snd, snd]);
}).add;
)



// =====================================================
// Create some Patterns
// =====================================================

// Create a clock to run the Pbindefs with
~clock = TempoClock.new(2).permanent_(true);

// I'll use the button number as the Pbindef name
(

// Bass
Pbindef(\36,
	\instrument, "playBuf",
	\dur, Pseq([1, Rest(1), 8/16, 8/16, Rest(1), ], inf),
	\bufnum, ~samples[0],
	\amp, Pseq([0.8, \rest, 0.3, 0.5, \rest],inf),
	\rate, 1.5
);

// High Hat
Pbindef(\37,
	\instrument, "playBuf2",
	\dur, Pseq([Rest(1),1], inf),
	\bufnum, ~samples[1],
	\amp, Pseq([\rest, 0.4], inf),
	\rate, 1
);

// Clap Other High Hat
Pbindef(\38,
	\instrument, "playBuf",
	\dur, Pseq([1/8, Rest(1/16), 1/16, 1/16, 1/2, Rest(7/8), 1/8, 1/2, Rest(1/2), Rest(1), 1, Rest(1) ], inf),
	\bufnum, ~samples[2],
	\amp, Pseq([0.4, 0.4, \rest, 0.4, 0.3, 0.4, \rest, 0.2, 0.4, \rest, \rest, 0.4, \rest], inf),
	\rate, 2
);

// zoom zoom
Pbindef(\39,
	\instrument, "playBuf",
	\dur, Pseq([1],inf),
	\bufnum, ~samples[5],
	\amp, 1,
	\rate, 1/2
);


/// NOT A SOUND -- THIS IS THE AUTO-MUTE STUFF
// FROM 40 TO 43
Pbindef(\40,
	\type, \rest,
	\onOff, 1,
	\mute, Pseq([1, 0], inf) * Pkey(\onOff),
	\test, Pfunc({ |ev| Ndef(\40).set(\amp, ev[\mute] )}),
	\dur, 1/8
).play(~clock, quant: 1).quant = 1;

Pbindef(\41,
	\type, \rest,
	\onOff, 1,
	\mute, Pseq([1, 0, 1, 0, 1], inf) * Pkey(\onOff), // fun 5 list
	\test, Pfunc({ |ev| Ndef(\41).set(\amp, ev[\mute] )}),
	\dur, 1/4
).play(~clock, quant: 1).quant = 1;



// . add others here










Pbindef(\44,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 10], inf),
	\bufnum, ~samples[8],
	\startPos, 0.3,
	\amp, 0.5,
	\rate, 1
);


Pbindef(\45,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 10], inf),
	\bufnum, ~samples[9],
	\amp, 0.5,
	\rate, 1
);

Pbindef(\46,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 10], inf),
	\bufnum, ~samples[10],
	\amp, 0.5,
	\rate, 1
);

Pbindef(\47,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 10], inf),
	\bufnum, ~samples[11],
	\amp, 0.5,
	\rate, 1
);

//high hat
Pbindef(\48,
	\instrument, "playBuf",
	\dur, Pseq([6/8, 2/8 , 1 ], inf),
	\bufnum, ~samples[12],
	\amp, Pseq([1, 1, 1], inf),
	\rate, 1
);


Pbindef(\49,
	\instrument, "playBuf",
	\dur, Pseq([1], inf),
	\bufnum, ~samples[13],
	\amp, 0.5,
	\rate, 1
);

Pbindef(\50,
	\instrument, "playBuf",
	\dur, Pseq([Rest(1), 10], inf),
	\bufnum, ~samples[14],
	\amp, 0.5,
	\rate, 1
);

Pbindef(\51,
	\instrument, "playBuf",
	\dur, 200,
	\bufnum, ~samples[6],
	\amp, 0.5,
	\rate, 0.5
);

)

// Stop all Pbindefs
// Pbindef.all.do({ |p| p.stop });

Pbindef(\41).clear

// =====================================================
// Play on QuNeo
// (buttons 36, 37, 38, 39, 40 will activate corresponding Pbindefs)
// Use "toggle" mode in SCLOrkQuNeo GUI
// =====================================================

(
q.onButtonChange = { |velocity, midinote|
	// if velocity is greater than zero, play sample; otherwise, just ignore if velocity = 0
	// first QuNeo button (36) will play sample at index 0
	// 37 plays sample at index 1
	// 38 plays sample at index 2
	// etc
	case
	{(midinote >= 40) && (midinote <= 47)} {
		if(velocity>80, {
			"I'm more than 80".postln;
			Ndef(midinote.asSymbol).clear(0);
			Ndef(midinote.asSymbol, {
				arg amp = 1;
				var dry, wet, snd;
				dry = SoundIn.ar(0) * Env.linen(1, 2, 0.1).kr;
				wet = NHHall.ar(
					in: dry!2,
					rt60: 4
				);
				snd = (dry * 1.0) + (wet * 0.3);
				snd = snd + CombC.ar(
					in: snd,
					maxdelaytime: 1,
					delaytime: 30/60, // < play wneith this number
					decaytime: 1000 // < and this number
				);
				snd = Limiter.ar(Mix.ar(snd)) * amp;
			}).play;

		}, {
			if(velocity>0,
				{
					case
					{(midinote>=40)&&(midinote<=43)} {
						Pbindef(midinote.asSymbol, \onOff, 1); // mute whole effect
					}
					{true} {
						Ndef(midinote.asSymbol).set(\amp, 1)
					};
					"between 1 and 60".postln;
				}, {
					case
					{(midinote>=40)&&(midinote<=43)} {
						Pbindef(midinote.asSymbol, \onOff, 0); // mute whole effect
					}
					{true} {
						Ndef(midinote.asSymbol).set(\amp, 0)
					};

					"MUTE".postln;

			});
		});
	}
	{true} {
		if(velocity>0, {
			// Play the Pbindef named with corresponding midinote number:
			Pbindef(midinote.asSymbol).play(~clock, quant: 4).quant = 4;
			["Button", midinote].postln;
		}, {
			// when velocity = 0,
			Pbindef(midinote.asSymbol).stop;
		});
	};
};
)



Pbindef(\40, \mute, 0); // mute whole effect
Pbindef(\40, \mute, Pseq([1, 0], inf)); // bring it back


Pbindef(\41, \mute, 0); // mute whole effect
Pbindef(\41, \mute, Pseq([1, 0], inf)); // bring it back


// notes from bruno:
// do more variatin in the notes
// mimic the bass of harrison and sam more
// get bass in order for any given time
// more tocata
// guitar action
// more wood block to fill the foreground
// highhat needs to be brighter
// patter needs to be more dominant for high hat
// build in the chord and the chord needs to be filtered
// ask bruno on how to do this
//





//__________

// ++ code copied from sam
/*(
q.onButtonChange = { |velocity, midinote|
// if velocity is greater than zero, play sample; otherwise, just ignore if velocity = 0
// first QuNeo button (36) will play sample at index 0
// 37 plays sample at index 1
// 38 plays sample at index 2
// etc
if(velocity>0, {
// Play the Pbindef named with corresponding midinote number:
Pbindef(midinote.asSymbol).play(~clock, quant: 4).quant = 4;
["Button", midinote].postln;
}, {
// when velocity = 0,
Pbindef(midinote.asSymbol).stop;
});
};
)*/
// -- end of copied code

// ++ code copied from sam
Pbindef(\38,
	\instrument, "playBuf",
	\dur, Pseq([1, Rest(1), 5/16, 3/16, 1/2, Rest(7/8), 1/8, 1/2, Rest(1/2), Rest(1), 1, Rest(1) ], inf),
	\bufnum, ~samples[12],
	\amp, 0.3,
	\rate, 1
).play(~clock, quant: 4).quant = 4;
// -- end of copied code
