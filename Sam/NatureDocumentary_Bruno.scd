/*
Nature Documentary : composition guidelines

Create a musical sequence of 10 minutes in length, based on the timeline and descriptions below. Your sequence will be one part of a larger composition created by Chamber SCLOrk; all individual parts created will be combined together to form the music.


- Follow the timeline below. The timeline is separated into multiple segments.
- Use a stopwatch to follow the score.
- Each segment has a description, think about what each description would sound like to you.
- Create a soundtrack for each description using Ndefs, Pbinds or a combination of the two (or any other code you choose).
- The code provided for the first few time points below is just "starter code". Modify it as you wish.
- Some segments have requested sound samples, sometimes their use will be guided, otherwise please integrate them in a way that seems right to you in the soundtrack for that segment (Playbuf.ar).
- Some segments have optional sound samples, you can integrate them or not.
- You can use any of the sample if desired during segments that don't specify usage.
- Have le fun.
*/


// Boot server and load samples (samples should be saved in same folder as this file)
// I chose single letter variables that are the initial of the sound in question (b for birds, c for crickets, f for frogs, h for harmonic rain, r for rain)
(
s.waitForBoot({
	b = Buffer.read(s, "ND_bluebird.flac".resolveRelative);
	c = Buffer.read(s, "ND_crickets.flac".resolveRelative);
	f = Buffer.read(s, "ND_frogs.flac".resolveRelative);
	h = Buffer.read(s, "ND_harmonic rain.flac".resolveRelative);
	r = Buffer.read(s, "ND_rhythm rain.flac".resolveRelative);

	SynthDef("grain-asr", {arg buffer, out = 0, rate = 1, startPos = 0, gate = 1, att = 0.01, rel = 0.1, amp = 1, ffreq = 4000, whichFilter = 0;
		var env, snd;
		env = Env.asr(att, amp, rel).kr(gate: gate, doneAction: 2);
		snd = PlayBuf.ar(1, buffer, rate: rate, startPos: startPos * BufSamples.kr(buffer));
		snd = snd * env;
		snd = Mix.ar(snd);
		snd = Select.ar(whichFilter,
			[
				LPF.ar(snd, ffreq),
				HPF.ar(snd, ffreq)
			]
		);

		Out.ar(out, snd);
	}).add;

	SynthDef("spacey", { arg freq=440, amp=0.2, out=0;
	var snd, env;
	env = Env.perc(level: amp).kr(2);
	snd = LFSaw.ar(freq: freq, mul: env);
	snd = RLPF.ar(
		in: snd,
		freq: LFNoise1.kr(2).range(500, 20000),
		rq: 0.2
	);
	Out.ar(out, snd);
}).add;

});
)

// Quick test:
b.play;
c.play;
f.play;
h.play;
r.play;


// Timeline and Descriptions

// =============================
// 0-10s
// Silence, darkness.


Ndef(\wow).fadeTime = 2; // pick a fadeTime (you should probably use this a lot in the score as you go down the timeline, according to the desired change -- abrupt or smooth?)

Ndef(\wow, { SinOsc.ar * 0 }).play; // pick your preferred silence :-) and start the Ndef






// =============================
// 10s-30s
// "Crickets" (required sample) fades in slowly (swell to K6 50). Darkness.


(
Ndef(\wow).fadeTime = 1; // big crossfade time
Ndef(\wow, {
	var snd;
	var sample = c; // crickets sample
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  sample,
		rate: XLine.kr(0.1, 0.2, 15) * BufRateScale.kr(sample),
		startPos: 0,
		loop:  1
	);
	snd = snd * XLine.kr(0.01, 0.5, 20);
	snd = Mix.ar(snd); // make sure it's mono
}).play;
)

// cheat sheet:
// rate is playback speed.
// 1 is normal speed, 0.5 is half speed (octave below), 2 is octave above, etc. Negative number makes it go backward.












// =============================
// 0:30s-1m
// "Frogs" (required sample) fades in to join "Crickets" (swell to K6 75). Darkness.


(
Ndef(\wow).fadeTime = 4; // big crossfade time
Ndef(\wow, {
	var snd;
	var sample = [c, f]; // crickets sample
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  sample,
		rate: LFTri.kr(1/10).range(0.1, 0.2) * BufRateScale.kr(sample),
		startPos: 0,
		loop:  1
	);
	snd = snd * 0.5; //XLine.kr(0.01, 0.5, 20);
	snd = Mix.ar(snd); // make sure it's mono
	snd = Limiter.ar(snd);
}).play;
);






// =============================
// 1m-1:10
// "Crickets" and "Frogs" begin to transform into electric impulses, sparking off into the darkness. Quick tiny flashes bursts, with their bursts coming more frequently.


(
Ndef(\wow).fadeTime = 1; // big crossfade time
Ndef(\wow, {
	var snd;
	var sample = [c, f]; // crickets sample
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  sample,
		rate: LFTri.kr(1/10).range(0.09, 0.15) * BufRateScale.kr(sample),
		startPos: 0,
		loop:  1
	);
	snd = snd * LFPulse.kr(
		freq: 10,
		width: Line.kr(1, 0.5, 10)).range(Line.kr(0.5, 0.3, 10), 0.5); //XLine.kr(0.01, 0.5, 20);
	snd = Mix.ar(snd); // make sure it's mono
	snd = Limiter.ar(snd);
}).play;
)



// =============================
// 1:11
// Suddenly, a meteor shower erupts and lights up the entire sky, lights up everything. Everything is blindingly white light. Eyes open for the first time. ("Cricket" and "Frogs" no longer required.)


Ndef(\wow).clear(3);
Ndef(\another).clear(1);

// Another way of playing samples:

(
Ndef(\wow).clear(3);
Pbindef(\cool,
	\instrument, "grain-asr",
	\buffer, c,
	\startPos, 0.1, // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
	\dur, 1/10,
	\att, 0.001,
	\rel, Pwhite(0.01, 0.5),
	\rate, Pseq([1, 1.5, 0.5, -1.1, 1.2], inf) * 15,
	// a negative number for \rate makes sound goes backward
	\amp, 0.75,
	\legato, 1,
	\whichFilter, 1,
	\ffreq, Prand([1000, 2500, 3333, 4444, 10000], inf)
).play;
)




Pbindef(\cool, \amp, Pseries(1.0, -0.05).max(0).trace); // "fade out" to zero


Pbindef(\cool, \amp, Pseries(1.0, -0.05).trace); // check out what happens without the max(0)

Pbindef(\cool).stop;



// =============================
// 1:12-2:07
// Eyes begin to adjust, still blurry.  Warmth and softly swirling light. Glowing, radiating, gradually swirling with increased speed, becoming like gusts of warm breeze or quick memories of dreams, felt by the hairs on your skin.

(
Pbindef(\cool,
	\instrument, "grain-asr",
	\buffer, Pseq([c, c, c, c, c, f], inf),
	\startPos, 0.1, // 0.0=beginning of sample, 0.5=half way into sample, 1.0=end of sample
	\dur, 1/10,
	\att, 0.001,
	\rel, Pwhite(0.01, 0.5),
	\rate, Pseq([1, 1.5, 0.5, -1.1, 1.2], inf) * Pseries(15, -0.05, inf).max(1).trace,
	// a negative number for \rate makes sound goes backward
	\amp, 0.75,
	\legato, 1,
	\whichFilter, 1,
	\ffreq, Prand([1000, 2500, 3333, 4444, 10000], inf)
).play;
)




// =============================
// 2:10-3:15
// The gusts become faster, more frequent. The light dims to a vibrant blue as the air cools.  Swirls of color move faster and faster until a rhythm is felt, a vibration.










// =============================
// 3:16-3:31
// You realize the vibration is inside you, getting louder and louder until...










// =============================
// 3:32-3:50
// Your heartbeat fills everything, your head, your body, everything around you pounds with it. It is racing! Deep dark blue and purple pulses. The sound is ancient.









// =============================
// 3:51
// Something smooth like a current of water starts to swell and weave through the heartbeat, starting softly and becoming stronger, growing until...






// =============================
// 3:56-4:11
// The heart stops and the rush of water floods you, weaving in and through you, every surface of your body vibrating with its movement.








// =============================
// 4:12-4:56
// The water continues to rush, its vibrations become warmer, until you realize it is 		not water but light. Its vibrations become tones that create a melody. The melody and speed of the light currents become faster and louder. The meteor show is inside you, the meteors are shooting out of your pores. You are afraid the light and speed will break you apart, when you realize you are singing.











// =============================
// 4:57(exact!)
// The heartbeat returns all at once, joins the light and heat.










// =============================
// 4:57-5:09
// Everything is glowing red, pulsing, churning, alive! (K6 90-100).








// =============================
// 5:10-5:17
// Everything begins to soften, darken, melt into smooth waves of glowing sensation. (Fade in "Rain Harmonics" required sample, can be integrated/altered according to how you see fit). (K6 gradually fade to 75).








// =============================
// 5:18-5:58
// Undulating, floating, dark, deep red, black, heart beat is slow or gone. You are far from where you began. ("Rain Harmonics" now optional).










// =============================
// 5:59-6:35
// You glance behind you, you see where you've come from. Quietly overcome with emotion, floating.








// =============================
// 6:37- 6:50
// You close your eyes and see the red glow of blood in your eyelids. Heartbeat starts to increase in volume, but beats at a steady, calm pace.











// =============================
// 6:51-7m
// You start to sense another heartbeat, faint at first, just as steady as yours but different, getting louder.








// =============================
// 7:01(exact)
// You open your eyes and another's eyes are looking into yours.













// =============================
// 7:02-7:07
// You look into each other's eyes.












// =============================
// 7:08-7:42
// They begin to dissolve, every line of their face blurring and separating, but their heart beat gets louder. You realize there is another heartbeat, and another, and another.  Multiple heartbeats, one after the other, come into your awareness, you can feel them all.







// =============================
// 7:43-8:10
// They keep coming, some are deep and booming, others are bright and shimmering, some speed up, others slow down.  You feel a tingling through your body, under the skin, not unpleasant but strange.  Waves of tingling wash over and across you as the heart beats continue to gather, everything getting louder until suddenly...









// =============================
// 8:11(exact)
// A BLINDING FLASH.
// Everything falls into one rhythm of many textures, colors, volumes.












// =============================
// 8:12-8:30
// Everything, the heartbeats, the tingles, the waves, are in unison.













// =============================
// 8:30-8:52
// The rhythms start to form a melody. Someone is humming, it might be you.











// =============================
// 8:53-9:09
// Everything drops out except for the humming. Someone is humming a melody. You aren't sure if it is you or someone else, or something else. It is calm, wandering, echoing at times, soft at other times, close and then far away, and then close again.










// =============================
// 9:10
// All stops.  Silence.  Darkness.







// =============================
// 9:16-9:30
// "Crickets" fade in (required sample "Crickets"). (K6 0-50)








// =============================
// 9:30-9:40
// "Frogs" fade in(required sample "Frogs"). (K6 50-75).










// =============================
// 10m
// END








