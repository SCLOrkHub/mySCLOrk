//////////////////////
// GRANULAR SAMPLING
// Code examples
//////////////////////

// Replace path (a string of characters) with a path to a wav or aiff file on your computer
b = Buffer.readChannel(server: s, path: "/home/sclork/Music/mySCLOrk/Sam/comb filter experiments mono.wav", channels: [0]);

// Load synthdef
(
SynthDef("grain-asr", {arg buffer, rate = 1, startPos = 0, gate = 1, att = 0.01, rel = 0.1, amp = 1, pan = 0;
	var env, snd;
	env = Env.asr(att, amp, rel).kr(gate: gate);
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  buffer,
		rate: rate,
		startPos: startPos * BufSamples.kr(buffer)
	);
	snd = snd * env;
	Out.ar(0, Pan2.ar(snd, pan));
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)

// ===================
// Pattern examples
// Note that in these examples grain duration is controlled indirectly through \dur, \legato, and \release
// Also because we are using Pbinds there is a limit on how many grains you can play per second

(
~stubborn = Pbind(
	\instrument, "grain-asr",
	\buffer, b,
	\startPos, 0, // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
	\dur, 90,
	\att, 0.001,
	\rel, 0,
	\rate, 0.8, //Pwhite(1, 1.5), // 1=original speed, 0.5=half speed, 2=twice speed, etc.
	// a negative number for \rate makes sound goes backward
	\amp, 1,
	\pan, Pwhite(-1.0, 1.0),
	\legato, 1
).play.stop;

~stubborn.play;
)

