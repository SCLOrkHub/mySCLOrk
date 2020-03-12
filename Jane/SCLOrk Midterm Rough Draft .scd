//'subpar'

//INTRO - begin the piece with no rhythm, just a bunch of long tones.  Soft, sine-waves esque

//P1 - Start to hear some beatings slowly.  K6 from from 0 - 20 in this section.

//P2 - sound of radio sample - Jane gon do this

//P3 - MouseX ndef all playing at different time OR each break into playing a triad

//P4 - Rhythm + Melody -- playing the first pattern on the Quneo --- one person playing drums, one person still on the tone ndef things, and erin about to play tax -- creschdo to 50 while we transition to two drums and nicole shuts off erin's sound.  Jane and Nicole turn K6 to 0 and erin plays sax.

//P5 - Erin sax solo, nicole/jane solo, and then we all come in at the same time and all the patterns line up.

//P6 -  End with same sound that we start with.  ALl move to that at the same time.

SCLOrkChat.new("jane")

//INTRO
(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 5; // change this number, anything between 1 to 32, then control + enter
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4 // you can also change the volume here
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)


//P1 - sinwave with beatings

//sinwave suoper deluxe
(
Ndef(\a).fadeTime = 5;
Ndef(\a, {
        var env = Env.perc(
        attackTime: 0.1, // attack
        releaseTime: 20, // release
        level: 0.9, // main volume
        curve: -100// concave or convex shape
        ).kr;
    var snd = LFPulse.ar(
        freq: 10 * [1, 11, 23, 96, 24],
        mul: LFSaw.ar(4).range(0, 1)
    );
    snd = LPF.ar(in: snd, freq: SinOsc.ar(12).range(500, 800));
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)

//sinwave beatings basic
(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 8;
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: SinOsc.ar(2).range(0.0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

//low rhythm - ME

(
Ndef(\a, {
    var snd = LFSaw.ar(
        freq: 43,
        mul: LFSaw.ar(4/1).range(0, 1)
    );
    snd = LPF.ar(in: snd, freq: LFPulse.ar(2).range(100, 1000));
    snd = Mix.ar(snd);
    snd = Limiter.ar(snd);
}).play;
)

//A Different Low Rhythm
(
Ndef(\a, {
    var harmonic, snd;
    harmonic = LFTri.ar(3).range(3, 13).round(1);
    snd = SinOsc.ar(
        freq: 13 * harmonic,
        mul: LFPulse.ar(4).range(0.1, 0.3)
    );
    snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)



//P3 - mouse x
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = 6;  //have one by on
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: SinOsc.ar(MouseX.kr(1, 44)).range(0.0, 0.5)
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


//p4 - overlaying triads for ground zero
(
Ndef(\a, {
	var harmonic, snd;
	// round numbers to ensure integers only:
	harmonic = SinOsc.ar(1/5).range(3, 13).round(1);
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
