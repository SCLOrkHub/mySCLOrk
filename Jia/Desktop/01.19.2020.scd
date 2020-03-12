SCLOrkChat.new("jia");

(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var harmonic, snd;
	harmonic = 13; // change this number, anything between 1 to 32.
	snd = LFSaw.ar(
		freq: 43 * harmonic * Line.kr(50, 0.1, 1),
		mul: Env.perc(
			attackTime:0.0001,
			releaseTime: 1.5,
			level: 2.0,
			curve: 6
		).kr;
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

(
Ndef(\a).fadeTime = 0; // try to loop this
Ndef(\a, {
	var harmonic, snd;
	harmonic = 13; // change this number, anything between 1 to 32.
	snd = LFSaw.ar(
		freq: 43 * harmonic * Line.kr(50, 0.1, 1),
		mul: Env.perc(
			attackTime: 0.0001,
			//releaseTime: 1.5,
			level: 2.0,
			curve: 6
		).kr;
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

(
Ndef(\bubbles, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = 32 * LFSaw.kr(15).range(1, 15).round(2); // two harmonics at same time
	snd = SinOsc.ar(
		freq: 43 * harmonic + [0, MouseX.kr(0, 4)],
		mul: LFNoise2.ar(5).range(0, 0.1)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\confusing, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(2).range(-30, 60).round(-10); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 43 * harmonic + [Line.kr(-200, 200, 5)],
		mul: LFSaw.ar(5).range(0.1, 0.5)
	);
	snd = FreeVerb.ar(snd, 0.5, 1.5, 1.5);
	snd = LPF.ar(snd, 1000).distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = 13 * SinOsc.ar(1/5).range(3, 13).round(1);
	snd = LFSaw.ar(
		freq: 43 * harmonic * Line.kr(50, 0.1, 1),
		mul: Env.perc(
			attackTime:0.0001,
			releaseTime: 1.5,
			level: 2.0,
			curve: 6
		).kr;
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;


// ++ code copied from aastha

Ndef(\a).fadeTime = 0; // low beat
Ndef(\a, {
	var harmonic, snd, dur;
	dur = 3.5;
	harmonic = [0.99, 1, 1.01]; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(start: 1, end: 0.5, dur: dur),
		//mul: Env.triangle(dur: 0.2, level: 0.4).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: 4
		).kr
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
// ++ code copied from aastha

(
Ndef(\wow).fadeTime = 0; //KEEP
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [10.5, 10.51, 10.49]; //[1, 1.001, 0.99];
	snd = LFTri.ar( //can change
		freq: harmonic * 10 * Line.kr(50, 0.5, 5.5) * MouseX.kr(0.5,30), // < let's finish on the tonic, 1 or 2 harmonic
		mul: LFSaw.ar(1/1).range(0.01, 0.5)
	);
	snd = LPF.ar(snd, 2500).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
(
Ndef(\wow).fadeTime = 0; // echo beat
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = LFTri.ar( //can change
		freq: harmonic * 10 * Line.kr(50, 0.5, 5.5) * MouseX.kr(-30,30),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
(
Ndef(\wow).fadeTime = 0; // KEEP
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = LFTri.ar( //can change
		freq: harmonic * 10 * Line.kr(5, 50, 10.5) * MouseX.kr(0.5,20),
		mul: Pulse.ar(1/1).range(0.01, 0.5) * MouseY.kr(0.5,3)
	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	snd = LPF.ar(snd, 1800).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// ++ code copied from noonan
(
Ndef(\snare, {
	var env, snd1, snd2, sum;
    env = Env.perc(1.01, 1.2, 0.1).kr;
    snd1 = HPF.ar(
        in: BrownNoise.ar,
        freq: 2000
    );
    snd2 = LFTri.ar(freq: 180);
    sum = snd1 + snd2;
    sum = sum * env;
    sum=Limiter.ar(Mix.ar(sum));
}).play;
)

// ++ code copied from noonan
(
Ndef(\b, { // bass & click
	var snd;
	snd = LPF.ar(snd, 300).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from aastha
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = Pulse.ar(1).range(-10, 30).round(-10); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 1 * harmonic + [Line.kr(-20, 300, 5)],
		//mul: LFSaw.ar(4).range(0.1, 0.5)
		mul: LFTri.ar(440)
	);
	snd = FreeVerb.ar(snd, 1.5, 1.5, 0.5);
	snd = LPF.ar(snd, 1500).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code

// ++ code copied from aastha
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	harmonic = Pulse.ar(1).range(-10, 50).round(-30); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 10 * harmonic + [Line.kr(-20, 300, 5)] + MouseX.kr(-30, 30),
		mul: LFSaw.ar(4).range(0.1, 0.5) //+ MouseX.kr(0.1, 30)
	);
	snd = FreeVerb.ar(snd, 0.5, 1.5, 2.5);
	snd = LPF.ar(snd, 1500).distort.distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code
