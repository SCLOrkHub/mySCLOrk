(
Ndef(\denial1, {
	var freq, snd;
	freq = (MouseX.kr(0, 200)%30)*20;
	snd = Pulse.ar(
		freq,
		SinOsc.ar(freq/5),
		mul: 0.5
	);
	snd = BLowPass.ar(snd, MouseY.kr(100, 20000));
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
Ndef(\denial1).stop;

(
Ndef(\denial1).clear(5);
Ndef(\denial2, {
	var freq, snd;
	freq = (MouseX.kr(0, 200)%30)*40;
	snd = SinOsc.ar(
		freq,
		Pulse.ar(freq/2),
		mul: 0.1
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
(
Ndef(\denial2).stop;

Ndef(\anger, {
	var harmonic, snd;
	harmonic = rrand(0, 1000)%7; // change this number, anything between 1 to 32, then control + enter
	snd = Saw.ar(
		freq: 43 * harmonic,
		mul: 0.9 // you can also change the volume here
	);
	snd = Fold.ar(snd, MouseX.kr(0, 200), MouseY.kr(0, 200));
	snd = Wrap.ar(snd, MouseY.kr(0, 10), MouseX.kr(0, 10));
	snd = FreeVerb.ar(snd, 0.4, 0.4, 0.9);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
Ndef(\anger).clear(10);

Ndef(\anger).stop;


(
Ndef(\depression, {
	var snd, amp, env;
	env = EnvGen.kr(
		Env.new([0,1,0], 3*[5, 5], [1, -4]),
		doneAction: 2
	);
	amp = SinOsc.kr({ExpRand(0.2, 12)}!6).range(0,0.6);
	snd = SinOsc.ar({ExpRand(50, 1200)}!6);
	snd = snd * amp * env;
	snd = FreeVerb.ar(snd);
	snd = Limiter.ar(Mix.ar(snd));

}).play;
)



( // for live coding
Ndef(\depression, {
	var snd, amp, env;
	env = EnvGen.kr(
		Env.new([0,1,0], [5, 5], [1, -4]),
		doneAction: 2
	);
	amp = SinOsc.kr({ExpRand(0.2, 12)}!6).range(0,0.6);
	snd = SinOsc.ar({ExpRand(50, 1200)}!6);
	snd = snd * amp * env;
	snd = FreeVerb.ar(snd);
	snd = Limiter.ar(Mix.ar(snd));

}).play;
)
Ndef(\depression).clear(10);

(
Ndef(\depression, {
	var snd, amp, env, snd2;
	env = EnvGen.kr(
		Env.new([0,1,0], [5, 5], [1, -4]),
		doneAction: 2
	);
	snd2 = SinOsc.ar(60);
	amp = SinOsc.kr({ExpRand(0.2, 12)}!6).range(0,0.6);
	snd = SinOsc.ar({ExpRand(50, 1200)}!6);
	snd = (snd * amp * env) + snd2;
	snd = FreeVerb.ar(snd);
	snd = Limiter.ar(Mix.ar(snd));

}).play;
)
Ndef(\depression).clear(10);



(
Ndef( \bargaining, {
	var snd, freq;
	freq = 47 * [2, 5, 8, 1] * SinOsc.ar(MouseY.kr(1/3, 60)).range(0.001, 0.21);
	snd = SinOsc.ar(freq);
	snd = BMoog.ar(snd * pi*MouseX.kr(0.5, 50), LFSaw.ar(5).range(20, 20000));
	snd = Limiter.ar(Mix.ar(snd));
}).play
)
Ndef(\bargaining).clear(10);

//code by grirgs
// (
// Ndef(\ota, { arg freq=200, pan=0, amp=0.1;
// 	var sig;
// 	var env1, env2, env3, env4, env5, env6, env7, env8;
// 	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8;
// 	var fac = 1/SelectX.kr( SinOsc.kr(1/113).range(0,6), 3*[1/2,1,2,4,8,64,128] )/8;
// 	env1 = EnvGen.ar(Env([42,21,42,30,84],[4,4,7.5,0.5]/fac).circle, 1);
// 	env2 = EnvGen.kr(Env([0,0,2,1],[4,4,4]).circle, 1);
// 	env3 = XLine.kr(1,0.1,20*1);
//
// 	freq = 8.collect({ arg x;
// 		freq + ( env1 * x ) + [0,SinOsc.kr(x+1, mul:env2).range(0,10+x)];
// 	});
// 	//freq.debug.shape.debug("freq");
// 	sig = SinOsc.ar( freq / [1,2,4]);
// 	//sig.shape.debug("sig1");
// 	sig = sig.collect({ arg isig, x;
// 		isig = SelectX.ar( SinOsc.kr(x+1/34).range(0,1), [isig, isig.fold2(env3)]);
// 		isig = SelectX.ar( SinOsc.kr(1/223, 5pi/2).range(0,1), [isig, ( isig * SinOsc.kr(1/48 * ( x + 1 )).range(1,100) ).tanh]);
// 	});
// 	//sig.shape.debug("sig2");
// 	sig1 = sig.flop[1];
// 	sig = sig.flop[0];
// 	//sig.debug("sig");
// 	sig1 = Pan2.ar(sig1, SinOsc.ar(sig1.size.collect({ arg x; SinOsc.kr(x/10+1.2).range(0,8) })) * SinOsc.kr(1/48).range(0,1), amp).mean;
// 	sig = Pan2.ar(sig, SinOsc.ar(sig.size.collect({ arg x; SinOsc.kr(x/10+1.1).range(0,8) })) * SinOsc.kr(1/58).range(0,1), amp).mean;
// 	sig = sig + sig1;
// 	sig = sig / 2.0;
// 	sig = LPF.ar(sig, 1999);
// 	sig * 2;
// }).play;
// )
// Ndef(/ota).clear(10);

// ++ code copied from SickJon
(
Ndef(\denial).fadeTime = 2;
Ndef(\denial, {
	var snd;

	snd = LFTri.ar(
		freq: (LFNoise0.ar(7).range( 5, 800)) * [1, 2],
		mul: LFNoise0.ar(5).range(0, 0.08);
	);
	D
	snd = CombC.ar(snd)


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from pneumonia
(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = 1/2*[1, 2.2];

	freq = 50 * harmonics * LFNoise1.ar(1/2).range(1, 5);


	snd = SinOsc.ar(freq: freq, mul: SinOsc.ar(10).range(0, 1));

	snd = Decay.ar(snd, 6);
				snd = FreeVerb.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
		Ndef(\depression).clear(5);
// -- end of copied code

// ++ code copied from josh
(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2, 3.4, 4.6, 5.8, 7];

	freq = 50 * harmonics * LFNoise1.ar(1/2).range(1, 15).round(1);


	snd = SinOsc.ar(freq: freq, mul: LFNoise1.ar(20).range(0, 1));

	snd = Decay.ar(snd);
	snd = CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.14), 5);
	snd = FreeVerb.ar(snd, 0.5, 0.7);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

