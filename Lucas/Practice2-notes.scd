SCLOrkChat.new("Lucas");
/*
Stages of Grief
Denial-
- NO?
- Vocal synth, f*ck up mic input
Anger-
- Distortion
- Aggresive, harsh sounds
Depression-
-

Bargaining-


Acceptance-


*/

// ++ code copied from josh
(
Ndef(\latchTime, {
	5
});

Ndef(\stretch, {
	7
});

Ndef(\ctrl1, {
	Latch.ar(Hasher.ar(Sweep.ar(Impulse.ar(freq: Ndef(\latchTime)/6, add: -0.5), Ndef(\stretch))), Impulse.ar(freq: Ndef(\latchTime), add: -0.5))
});
)

(
Ndef(\thing, {
	var snd, env, array;
	array = Array.exprand(13, 2, 20);
	env = Dust.ar(10);
	snd = DynKlank.ar(`[
		array;
		nil,
		1/array],
	input: env,
	freqscale: Ndef(\ctrl1),
	decayscale: 2);
	snd = Limiter.ar(Mix.ar(LeakDC.ar((snd * 5).tanh)));
	snd = LeakDC.ar(snd);
	Out.ar(0, snd ! 2);
}).play;
)
// -- end of copied code
