~jia2 = "wow";
//cannot be a capital letter, always uppercase

x = 10; //a single lowercase letter is a global variable
(
var nicole, jonny, jia;
nicole = 10;
jonny = 9.1;
jia = 11 + nicole + jonny;
jia.postln;
jia = jia * 2;
jia.postln;
"aastha".postln;
~jia2.postln;
x.postln;
)


(
Ndef(\a, {
	var harmonic, snd;
	harmonic = 7; // change this number, anything between 1 to 32, then control + enter
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: 0.4 // you can also change the volume here
	);

	snd = Limiter.ar(Mix.ar(snd)); // don't change this line, limiter will limit volume to 1
}).play; //mix.ar converts however many channels into 1 channel since we are monochannel
)

// you do not need to use control period -- simply change the number as you like, then run control+enter right again, the sound will update immediately.

// if you don't like the abruptness of the sound change, you can specify crossfade times:

Ndef(\a).fadeTime = 2; // run this, then go back to the block of code above and do more changes.


// another variation:
(
Ndef(\a).fadeTime = 0;
Ndef(\a, {
	var harmonic, snd, dur;
	dur = 1.5;
	harmonic = 2; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic * Line.kr(start: 1, end: 0.5, dur: dur),
		//mul: Env.triangle(dur: 0.2, level: 0.4).kr // an automatic up and down in volume (triangle shape),, env.perc is another option
		mul: Env.perc(
			attackTime: 0.01,
			releaseTime: dur,
			level: 1.0,
			curve: -4
		).kr
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)
//ar: audio rate (lot more processing pwoer)
//kr: control rate (a lot less but still fine grained enough)

// you can have more than one Ndef simultaneously, just give it a different name:
(
Ndef(\wow, {
	var harmonic, snd;
	harmonic = 9; // change this number, anything between 1 to 32.
	snd = SinOsc.ar(
		freq: 43 * harmonic,
		mul: Env.triangle(dur: 15, level: 0.4).kr // an automatic up and down in volume (triangle shape)
	);
	snd = Limiter.ar(Mix.ar(snd)); // don't change this line
}).play;
)

Ndef(\wow).fadeTime = 1; // choose fade time here for Ndef(\wow)



// try also changing SinOsc to Saw, LFSaw, Pulse, or LFTri