// =======================
// SCLOrkQuNeo Drum Pad Example
// Example 2 - Using Patterns
// =======================
SCLOrkChat("Harrison").new;
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
~folder = "/home/sclork/Downloads/audio files for project/audio files for project" ;
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
~samples[3].play;
~samples[4].play;
~samples[5].play;
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



// =====================================================
// Create some Patterns
// =====================================================

// Create a clock to run the Pbindefs with
~clock = TempoClock.new(80/60).permanent_(true);

// I'll use the button number as the Pbindef name
(

Pbindef(\51,
	\instrument, "playBuf",
	\dur, 8,
	\bufnum, ~samples[0],
	\amp, 0.5,
	\rate, 1
).play(~clock, quant: 4).quant = 4;

Pbindef(\50,
	\instrument, "playBuf",
	\dur, Pseq([2, 2], inf),
	\bufnum, ~samples[1],
	\amp, 0.20,
	\rate, 2
).play(~clock, quant: 4).quant = 4;

Pbindef(\49,
	\instrument, "playBuf",
	\dur, 200,
	\bufnum, ~samples[6],
	\amp, 0.5,
	\rate, 1/2
).play(~clock, quant: 4).quant = 4;

Pbindef(\48,
	\instrument, "playBuf",
	\dur, Pseq([10, 8, 8], inf),
	\bufnum, ~samples[8],
	\amp, 0.5,
	\att, 0.1,
	\rate, 1
).play(~clock, quant: 4).quant = 4;

Pbindef(\47,
	\instrument, "playBuf",
	\dur, Pseq([1, Rest (1), 1, 0.25, 0.25], inf),
	\bufnum, ~samples[10],
	\amp, 0.4,
	\rate, 4
).play(~clock, quant: 4).quant = 4;

Pbindef(\46,
	\instrument, "playBuf",
	\dur, Pseq([1, 1, 8/16, 8/16, 1/2], inf),
	\bufnum, ~samples[11],
	\amp, 0.3,
	\rate, 1/2
).play(~clock, quant: 4).quant = 4;

Pbindef(\45,
	\instrument, "playBuf",
	\dur, Prand([
		Pseq([Rest(1/2), 1/2], 4),
		Pshuf([Rest(0.5), 0.25, 0.25, Rest(0.5), 0.5, Rest(0.5), 0.5], 1)
	], inf),
	\bufnum, ~samples[15],
	\amp, Pwhite(0.25, 0.5),
	\rate, Pwrand([1, 2], [0.9, 0.2], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\44,
	\instrument, "playBuf",
	\dur, Pseq([1, 4, 2], inf),
	\bufnum, ~samples[16],
	\amp, Pwhite(0.15, 0.3),
	\rate, 1
).play(~clock, quant: 4).quant = 4;


Pbindef(\43,
	\instrument, "playBuf",
	\dur, Prand([
		Pseq([Rest(1/2), 1/4], 4),
		Pshuf([1, 0.5, 1, Rest(0.5), 1, 0.5, 1], 1)
	], inf),
	\bufnum, ~samples[14],
	\amp, Pwhite(0.25, 0.5),
	\rate, Pwrand([1, 2], [0.8, 0.2], inf)
).play(~clock, quant: 4).quant = 4;

Pbindef(\42,
	\instrument, "playBuf",
	\dur, Pseq([1,1,1/2, 1/2, 2], inf),
	\bufnum, ~samples[12],
	\amp, Pwhite(0.15, 0.3),
	\rate, 1
).play(~clock, quant: 4).quant = 4;

Pbindef(\41,
	\instrument, "playBuf",
	\dur, 8,
	\bufnum, ~samples[18],
	\amp, 0.5,
	\rate, 1/2
).play(~clock, quant: 4).quant = 4;

)

// Stop all Pbindefs
Pbindef.all.do({ |p| p.stop });


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
	if(velocity>0, {
		// Play the Pbindef named with corresponding midinote number:
		Pbindef(midinote.asSymbol).play(~clock, quant: 4).quant = 4;
		["Button", midinote].postln;
	}, {
		// when velocity = 0,
		Pbindef(midinote.asSymbol).stop;
	});
};
)