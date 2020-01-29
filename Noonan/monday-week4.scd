(
SynthDef("harpsy", { arg out = 0, freq = 440, amp = 0.1, pan = 0, rel = 3;
    var env, snd, snd2;
	env = Env.perc(releaseTime: rel, level: amp).kr(doneAction: 2);
	snd = Pulse.ar(freq, SinOsc.ar(MouseY.kr(1, 5)).range(0.25, 0.5));
	snd2 = SinOsc.ar(freq);
	snd = snd+snd2;
	snd = snd * env;
	snd = LPF.ar(snd, 800, 6);
	snd = FreeVerb.ar(snd, 0.9, 0.9, 0.9, 2);
	//snd = snd.clip.clip;
	snd = snd.tanh;
	snd = Mix.ar(snd);
	Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
	credit: "unknown",
	category: \keyboards,
	tags: [\pitched, \harpsichord]
)
).add;


Pbindef(\melody2,
	\instrument, "harpsy",
	\dur, Pwrand([0.125, 0.0625, 0.25, 0.5], [0.7, 0.1, 0.1, 0.1], inf)/2 ,
	\amp, Prand([0, 0, 0.5], inf),
	\ctranspose, Prand([-24, -12, 0, 12, 24], inf),
	\degree, Prand([0, 2b, 0, 4, 0, 7, 0, 6, 0, 4, 0, 3, 0, 2b, 1, 1b], inf),
	\rel, 0.2
).play(~clock, quant: 4).quant = 4;

)