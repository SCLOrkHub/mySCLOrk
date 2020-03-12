SCLOrkChat.new("josh");
/blink |========|

Stethoscope.new;
FreqScope.new;
{Hasher.ar(Sweep.ar(Impulse.ar(freq: 40, add: -0.5)))}.play;

(
Ndef(\latchTime, {
	7
});

Ndef(\stretch, {
	5
});

Ndef(\ctrl1, {
	Latch.ar(Hasher.ar(Sweep.ar(Impulse.ar(freq: Ndef(\latchTime)/9, add: -0.5), Ndef(\stretch))), Impulse.ar(freq: Ndef(\latchTime), add: -0.5))
});
)

(
Ndef(\thing, {
	var snd, env, array;
	array = Array.linrand(10, 1, 8);
	env = Dust.ar(4);
	snd = DynKlank.ar(`[
		array;
		nil,
		1/array],
	input: env,
	freqscale: Ndef(\ctrl1),
	decayscale: 0.1);
	snd = Limiter.ar(Mix.ar(LeakDC.ar((snd * 100).tanh)));
	snd = LeakDC.ar(snd);
}).play;
)


(
Ndef(\evensimpler, {
	var env, snd;
	env = Env.perc(0.5, 5, 1, -16).ar(doneAction: 2);
	snd = SinOsc.ar(freq: ((env) * 700) + 30, mul: env * 0.5);
	snd = Limiter.ar(Mix.ar(LeakDC.ar(snd)));
}).play;
)

snd = Clip.ar(snd, 0.4, 0.5); //asymetrical


(
Ndef(\thing, {
	var snd, env;
	env = Env.perc(0.01, 1, 1, -2).ar(doneAction: 2);
	snd = Saw.ar(340);
	snd = RHPF.ar(in: snd, freq: LinExp.ar((env), 0, 1, 10, 33), rq: 0.1);
	snd = Limiter.ar(Mix.ar(LeakDC.ar((snd * env))));
	snd = LeakDC.ar(snd);
}).play;
)