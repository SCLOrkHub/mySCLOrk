(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = Saw.ar(
		freq: harmonic * 20 * 2, // < let's finish on the tonic, 1 or 2 harmonic
		mul: SinOsc.ar(1/5).range(0.1, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
//save this: sounds like rain
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = Pulse.ar(
		freq: harmonic * Pulse.ar(1/5).range(0.1, 0.8) * [1, 2, 6], // < let's finish on the tonic, 1 or 2 harmonic
		mul: Pulse.ar(1).range(0.1, 0.5)
	);
	snd = LPF.ar(snd, 1300).distort.distort;
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)

//weird beat
(
Ndef(\pulsingbeat).fadeTime = 0;
Ndef(\pulsingbeat, {
	var harmonic, snd, dur;
	dur = 2;
	harmonic = [0.88, 1, 1.01]; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(start: 1, end: 0.5, dur: dur),
		//mul: Env.triangle(dur: dur, level: 2).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		/*mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: 4
		).kr*/
		mul: Pulse.ar(1.5).range(dur, dur+5) //this makes it repeat

	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)



// ++ code copied from jia
(
Ndef(\wow).fadeTime = 1;
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99]; //[1, 1.001, 0.99];
	snd = SinOsc.ar(
		freq: harmonic * 10 * Line.kr(50, 0.5, 1.5), // < let's finish on the tonic, 1 or 2 harmonic
		mul: Pulse.ar(1/1).range(0.1, 0.4)
	);
	//snd = LPF.ar(snd, 1000).distort.distort;
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// ++ code copied from noonan
(
Ndef(\snare, {
	var env, snd1, snd2, sum;
    env = Env.perc(0.01, 0.2, 0.1).kr;
    snd1 = HPF.ar(
        in: WhiteNoise.ar,
        freq: 1800
    );
    snd2 = SinOsc.ar(freq: 180);
    sum = snd1 + snd2;
    sum = sum * env;
    sum=Limiter.ar(Mix.ar(sum));
}).play;
)
// -- end of copied code

(
Ndef(\a, {
	var harmonic, snd;
	// try out LFNoise1 and LFNoise2 as well:
	harmonic = LFNoise0.kr(5).range(1, 5).round(1); // two harmonics at same time
	snd = Saw.ar(
		freq: 43 * harmonic,
		mul: LFPulse.ar(4).range(0.1, 0.3)
	);
	snd = LPF.ar(snd, 1400).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// ++ code copied from noonan
(
Ndef(\snare, {
	var env, snd1, snd2, sum;
    env = Env.perc(0.01, 0.2, 0.1).kr;
    snd1 = HPF.ar(
        in: WhiteNoise.ar,
        freq: 1800
    );
    snd2 = SinOsc.ar(freq: 180);
    sum = snd1 + snd2;
    sum = sum * env;
    sum=Limiter.ar(Mix.ar(sum));
}).play;
)
// -- end of copied code




// ++ code copied from noonan
(
Ndef(\beat, {
	var snd;

	snd = Saw.ar(72);

	snd = LPF.ar(snd, Pulse.ar(1).range(100, 500));

	snd = Limiter.ar(Mix.ar(snd));
	//
	// snd = FreeVerb.ar(snd, 0.1, 0.1);


}).play;
)
// -- end of copied code

(
Ndef(\beat, {
	var snd;

	snd = Saw.ar((72-24));

	snd = LPF.ar(snd, Saw.ar(1).range(100, 500));

	snd = Limiter.ar(Mix.ar(snd));


}).play;
)



// ++ code copied from jia
(
Ndef(\wow).fadeTime = 0; // KEEP
Ndef(\wow, {
	var snd, harmonic;
	harmonic = [1, 1.001, 0.99];
	snd = SinOsc.ar( //can change
		freq: harmonic * 10 * Line.kr(0.5, 0, 5.5),
		mul: Pulse.ar(1/1).range(0.01, 0.5)
	);
	snd = FreeVerb.ar(snd, 0.5, 0.5, 0.5);
	//snd = LPF.ar(snd, 1800).distort.distort; // can comment out
	snd = Limiter.ar(Mix.ar(snd))
}).play;
)
// -- end of copied code

// weird interesting beat, starts off kinda strange
(
Ndef(\interestingsoundidk, {
	var harmonic, snd;
	harmonic = Pulse.ar(1).range(-10, 30).round(-10); // two harmonics at same time
	snd = LFSaw.ar(
		freq: 1 * harmonic + [Line.kr(-20, 300, 5)] + MouseX.kr(1.5, 30),
		mul: LFSaw.ar(4).range(0.1, 0.5) + MouseY.kr(0.1, 30) + (0.1*SinOsc.ar(330))//add or remove the Sin
	);
	snd = FreeVerb.ar(snd, 0.5, 1.5, 2.5);
	snd = LPF.ar(snd, 1500).distort.distort;
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code


(
Ndef(\pulsingbeatbutweird).fadeTime = 0;
Ndef(\pulsingbeatbutweird, {
	var harmonic, snd, dur;
	dur = 4;
	harmonic = [0.999, 1, 1.091]; // change this number, anything between 1 to 32.
	snd = Saw.ar(
		freq: 43 * harmonic * [Line.kr(start: 1, end: 0.5, dur: dur)] * MouseX.kr(1.5, 30),
		//mul: Env.triangle(dur: dur, level: 2).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		/*mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: 4
		).kr*/
		mul: Pulse.ar(1.5).range(dur, dur+5) * MouseY.kr(2, 20)//this makes it repeat

	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)