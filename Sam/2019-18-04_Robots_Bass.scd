p = Pseq([0.85, 1.0, 1.1, 1.25, 0.85*2]/2, inf).asStream;
p.next;

(
Ndef(\wow).fadeTime = 0;
Ndef(\wow, {
	arg freq, snd, env;
	env = Env.perc(
		attackTime: 0.01,
		releaseTime:1,
	).kr;
	// freq = SinOsc.kr(LFNoise2.ar(1).range(2, 4)).range(100, 200).round(50);
	freq = Ndef(\freq1).kr * XLine.kr(0.6, 1.0, Rand(1/6, 1/4)) * 0.85/2; //p.next;
	snd = LFSaw.ar(freq) * env;
	snd = snd * LFPulse.ar(freq: 1/[2.1, 4], width: 0.8);


	snd = snd.distort.distort.distort.distort.distort.distort.tanh;
	snd = BPF.ar(snd, freq * 1, 0.5, 4);
	snd = FreeVerb.ar(snd, 0.8);
	snd = Mix.ar(snd);
	snd = Limiter.ar(snd);
}).play;
)

Ndef(\freq1, { LFSaw.kr(LFNoise2.ar(1).range(1/4, 1)).range(50, 600).round(50) });
Ndef(\freq1, { SinOsc.kr(LFNoise2.ar(1).range(1/2, 4)).range(100, 200).round(50) });
Ndef(\freq1, { LFNoise2.kr(LFNoise2.ar(1).range(2, 4)).range(100, 300).round(40) });
Ndef(\freq1, { LFNoise0.kr(LFNoise2.ar(1).range(5, 14)).range(100, 650).round(40) });
Ndef(\freq1, { LFNoise0.kr(LFNoise2.ar(1).range(5, 14)).range(100, 100).round(40) });

Ndef.clear(1)