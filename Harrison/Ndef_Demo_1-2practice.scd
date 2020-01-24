(
var nicole, jonny, jia;
nicole = 10;
jonny = 9.1;
jia = 11;

jia.postln;
jia = jia * 90;
jia.postln;
)

~jia2 = "wow"
//^no capital leters, no capital "J"
//Ndef can have any name
//ex.
(
Ndef(\randomname, {}).play;
)
//another way to stop and not use control+period
Ndef(\randomname).stop;

//var symbolizes beginning of creation

(
Ndef(\heckya, {
	var harmonic, snd;

	harmonic = 3;
	snd = LFPulse.ar(
		freq: 110 * harmonic,
		mul: 0.2
	);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 7; // change this number, anything between 1 to 32, then control + enter
	snd = LFSaw.ar(
		freq: 43 * harmonic,
		mul: 0.4 // you can also change the volume here
	);
	//snd=FreeVerb.ar(snd);
	//look at code from inside out
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

// you do not need to use control period -- simply change the number as you like, then run control+enter right again, the sound will update immediately.

// if you don't like the abruptness of the sound change, you can specify crossfade times:

Ndef(\a).fadeTime = 2; // run this, then go back to the block of code above and do more changes.


// another variation:
(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 17; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: Env.triangle(dur: 15, level: 0.6).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

//click "tab" to autofill numbers when using parentheses
// you can have more than one Ndef simultaneously, just give it a different name:
(
Ndef(\wow, {
	var harmonic, snd;
	harmonic = 2; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(1, 0.9, 0.2) ,
		mul: Env.perc(0.01, 4, 1.0).kr // an automatic up and down in volume (triangle shape)           ^^Can replace "triangle" with "perc", click "tab" to autofill numbers when using parentheses
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play
)

Ndef(\wow).fadeTime = 1; // choose fade time here for Ndef(\wow)



// try also changing SinOsc to Saw, LFSaw, Pulse, or LFTri