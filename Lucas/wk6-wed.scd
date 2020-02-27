s.reboot;

(
Ndef(\denial).fadeTime = 2;
Ndef(\denial, {
	var snd;

	snd = LFTri.ar(
		freq: (LFNoise0.ar(20).range(5, 60)) * [1, 5, 2, 4, 9],
		mul: LFNoise0.ar(5).range(0, 0.08);
	);
	snd = CombC.ar(snd);
	snd = ;


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


(
var winenv;
// a custom envelope
winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);

SynthDef(\fm_grain_test, { |out, gate = 1, amp = 1, envbuf|
    var pan, env, freqdev;
    // use mouse x to control panning
    pan = MouseX.kr(-1, 1);
    // use WhiteNoise and mouse y to control deviation from center pitch
    freqdev = WhiteNoise.kr(MouseY.kr(0, 400));
    env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp,
        doneAction: Done.freeSelf);
    Out.ar(out,
        GrainFM.ar(2, Impulse.kr(10), 0.1, 440 + freqdev, 200, LFNoise1.kr.range(1, 10),
            pan, envbuf) * env)
}).add;

)

// use built-in env
x = Synth(\fm_grain_test, [\envbuf, -1])

// switch to the custom env
x.set(\envbuf, z)
x.set(\envbmuf, -1);

x.set(\gate, 0);