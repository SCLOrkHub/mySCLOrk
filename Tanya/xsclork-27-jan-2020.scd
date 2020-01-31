
// alien sounds
// ++ code copied from b2020
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 120;
	amp = 0.1;
	rel = 1;
	env = Env.sine(dur: 5, level: 2).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(1/2).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)
// -- end of copied code

// wow robotic
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 20;
	amp = 0.1;
	rel = 1;
	env = Env.sine(dur: 5, level: 2).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(1/2).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)

// purrrrrrrrr
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 10;
	amp = 0.1;
	rel = 1;
	env = Env.sine(dur: 5, level: 2).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(1/2).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)


// WOWWWWWWW
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 120;
	amp = 0.1;
	rel = 1;
	env = Env.sine(dur: 3.5, level: 0.2).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = SinOsc.ar(freq * SinOsc.ar(1/2).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)


// alarm
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 120;
	amp = 0.1;
	rel = 1;
	env = Env.triangle(dur: 5, level: 2).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = Pulse.ar(freq * SinOsc.ar(1/2).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)



// iphone ringing
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 180;
	amp = 0.1;
	rel = inf;
	env = Env.linen(attackTime: 0.01, releaseTime: 1.5).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = LFTri.ar(freq * Pulse.ar(1/3).range(0.975, 1.025));
	snd = Mix.ar(snd) * env * 30;
	// snd = Fold.ar(snd, -1, 1);
	// snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)



// heartbeat and oo ee and dISTORTION
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	arg env, snd, freq, amp, rel;
	freq = 900;
	amp = 0.1;
	rel = 9;
	env = Env.triangle(dur: 1, level: 9).ar(doneAction: 2);
	// env = Env.perc(releaseTime: rel, level: 1).ar(doneAction: 2);
	snd = LFTri.ar(freq * LFPulse.ar(3).range(1.975, 1.025));
	snd = Mix.ar(snd) * env * 20;
	// snd = Fold.ar(snd, -1, 1);
	snd = RLPF.ar(snd, LinExp.ar(env, 0, 1, freq * 4, 10000), 0.8);
	snd = Mix.ar(snd * amp);
	snd = Limiter.ar(snd);
}).play
)





