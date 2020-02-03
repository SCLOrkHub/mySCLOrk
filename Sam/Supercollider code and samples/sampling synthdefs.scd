

c = Buffer.readChannel(server: s, path: "/home/sclork/Music/mySCLOrk/Sam/Supercollider code and samples/lft_808kit_snr_9.wav", channels: [0]);

d = Buffer.readChannel(server: s, path: "/home/sclork/Music/mySCLOrk/Sam/Supercollider code and samples/lh2_kick_one_shot_thik.wav", channels: [0]);


(
SynthDef("grain-perc", {arg buffer, rate = 1, startPos = 0, pan = 0, bufDur = 0.5, amp = 0.1;
	var env, snd;
	env = Env.linen(0, bufDur, 0).kr;
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

(
SynthDef("ReverbDef", {arg buffer, rate = 1, startPos = 0, gate = 1, att = 0.01, rel = 0.1, amp = 1, pan = 0;
	var env, snd;
	env = Env.asr(att, amp, rel).kr(gate: gate);
	snd = PlayBuf.ar(
		numChannels:  1,
		bufnum:  buffer,
		rate: rate,
		startPos: startPos * BufSamples.kr(buffer)
	);
	snd = snd * env;
	snd = FreeVerb.ar(
		in: snd,
		mix: 0.6,
		room:  0.7,
		damp: 0.9
	);
	Out.ar(0, Pan2.ar(snd, pan));
	DetectSilence.ar(snd, doneAction: 2);
}).add;
)

(
~snare = Pbind(
	\instrument, "grain-perc",
	\buffer, c,
	\startPos, 0,
	\dur, Pseq([Rest(1/4), 1/4, Rest(1/4),1/4, Rest(1/4),1/4, Rest(1/4), 1/4, Rest(1/4), 1/4, Rest(1/4),1/4, Rest(1/4),1/4, Rest(1/4), 1/4], 2)*4,
	\bufDur, c.duration,
	\rate, 1,
	\amp, 0.1,
	\pan, 0,
	\legato, 1
).play;
~snare = Pbind(
	\instrument, "grain-perc",
	\buffer, d,
	\startPos, 0,
	\dur, Pseq([1/4, Rest(1/8), 1/ ,1/8, 1/8, Rest(1/4),1/4, Rest(1/4), 1/4, Rest(1/4), 1/4, Rest(1/4),1/4, Rest(1/4),1/4, Rest(1/4), 1/4, Rest(1/4)], 2)*4,
	\bufDur, d.duration,
	\rate, 1,
	\amp, 0.1,
	\pan, 0,
	\legato, 1
).play;
)
