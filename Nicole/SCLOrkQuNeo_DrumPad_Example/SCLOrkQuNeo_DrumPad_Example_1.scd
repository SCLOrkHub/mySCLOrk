// =======================
// SCLOrkQuNeo Drum Pad Example
// =======================

// Connect SCLOrkQuNeo
q = SCLOrkQuNeo.new

// Boot server
s.boot;

// ******************************************************
// Turn on the MIDI button on the graphical interface.
// Make sure you are in QuNeo preset #3.
// ******************************************************

// Three folders with drum sounds provided for this demo -- pick one;
// (run only the one line you want)

~folder = "HardElectro1";
// ~folder = "Audiophob";
// ~folder = "TR808EmulationKit";

// Load all sound files in that folder into Buffers
// NOTE: make sure your server is ON
~samples = (~folder ++ "/*").resolveRelative.pathMatch.collect({ |p| Buffer.readChannel(s, p, channels: [0]) });

// Quick test
// The variable ~samples now holds an Array that stores samples at numbered indices
~samples[0].play;
~samples[1].play;
~samples[2].play;

~samples.size; // how many samples in this collection


// =====================================================
// NO-FRILLS VERSION
// Just play the samples, one per button, that's all
// =====================================================

(
q.onButtonChange = { |velocity, midinote|
	// if velocity is greater than zero, play sample; otherwise, just ignore if velocity = 0
	// first QuNeo button (36) will play sample at index 0
	// 37 plays sample at index 1
	// 38 plays sample at index 2
	// etc
	if(velocity>0, {
		var index = midinote - 36;
		if(~samples[index].notNil, {
			~samples[index].play;
			["Button", midinote, "Index", index].postln;
			PathName(~samples[index].path).fileName.postln;
		}, { "nothing here".postln })
	});
};
)



// =====================================================
// MAKE IT RESPOND TO VELOCITY
// Just like the above, but this one responds to how hard you push
// =====================================================

(
q.onButtonChange = { |velocity, midinote|
	if(velocity>0, {
		var index = midinote - 36;
		if(~samples[index].notNil, {
			~samples[index].play(mul: velocity.linlin(0, 127, 0, 1));
			["Button", midinote, "Velocity", velocity, "Index", index].postln;
			PathName(~samples[index].path).fileName.postln;
		}, { "nothing here".postln })
	});
};
)




