//========================================================//
 //                                                        //
//                        GRIEF                           //
 //                                                        //
//========================================================//



/*
Live Performance Piece
By Jonathan Claridad, Josh Mitchell, Lucas Moreira



*/


SCLOrkChat.new("Jonathan");








//=========================
// Denial
//=========================

// short percussive bursts of sound
// perhaps like something is going to start, but stops abruptly



(
Ndef(\denial).fadeTime = 2;
Ndef(\denial, {
	var snd;

	snd = LFTri.ar(
		freq: (LFNoise0.ar(5).range(50, 800)) * [1, 2],
		mul: LFNoise0.ar(5).range(0, 0.08);
	);

	snd = CombC.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// Transition point in/out of anger
(
Ndef(\denial).fadeTime = 10
;
Ndef(\denial, {
	var snd;

	snd = LFTri.ar(
		freq: (LFNoise0.ar(5).range(50, 800)) * [1, 2],
		mul: LFNoise0.ar(5).range(0, 0.08);
	);

	// snd = CombC.ar(snd);
	snd = snd + CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.14), 5, 0.5);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef.clear(10);








//=========================
// Bargaining
//=========================

// two frequencies moving in and out of sync, playing with beatings


// the bad one
(
Ndef(\bargaining).fadeTime = 2;
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(500, 1500).round(100);
	maxwidth = 100;

	snd = LFTri.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);
	snd = CombC.ar(snd);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// the good one
(
Ndef(\bargaining).fadeTime = 10;
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(100, 500) * LFNoise0.ar(10).range(1, 2);
	maxwidth = 100;

	snd = LFTri.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// transition
(
Ndef(\bargaining).fadeTime = 2;
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(500, 1500);
	maxwidth = 100;

	snd = LFTri.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);
	snd = CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.14), 5);
	snd = Decay.ar(snd);
	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef.clear(10);






//==========================
// Depression
//==========================



(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2];

	freq = (50 * harmonics) * [1];


	snd = SinOscFB.ar(freq: freq, feedback: MouseX.kr(0, 1.6), mul: SinOsc.ar(10).range(0, 1));


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


// LFNoise boy

(
Ndef(\depression2).fadeTime = 2;
Ndef(\depression2, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2];

	freq = 60 * harmonics * LFNoise1.ar(1/2).range(1, 5);


	snd = SinOsc.ar(freq: freq, mul: SinOsc.ar(10).range(0, 1));

	snd = Decay.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)




(
Ndef(\depression).fadeTime = 2;
Ndef(\depression, {
	var snd, env, freq, harmonics;

	harmonics = [1, 2.2, 3.4, 4.6, 5.8, 7];

	freq = 60 * harmonics * LFNoise0.ar(5).range(1, 15);


	snd = SinOsc.ar(freq: freq, mul: LFTri.ar(10).range(0, 1));
	snd = CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.2), 5);
	snd = Decay.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef.clear(10);




//=======================
// Anger
//=======================

// bubbling washes of sound
// OR
// sporadic lines of notes with short att and rel

(
Ndef(\anger).fadeTime = 2;
Ndef(\anger, {
	var snd, freq, width;

	width = MouseY.kr(50, 500);

	freq = SinOsc.ar(11).range((width - 50), (width + 50));
	freq = [freq, (freq * 2), (freq * 3), (freq / 2)];


	snd = Saw.ar(
		freq: freq,
		mul: LFNoise0.ar(5).range(0, 0.1)
	);
	snd = CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.2), 5);

	snd = FreeVerb.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// go here out of anger?

(
Ndef(\anger).fadeTime = 2;
Ndef(\anger, {
	var snd, freq, width;

	width = MouseY.kr(50, 500);

	freq = SinOsc.ar(20).range((width - 50), (width + 50));
	freq = [freq, (freq * 2), (freq * 3), (freq / 2)];


	snd = Saw.ar(
		freq: freq,
		mul: 0.1
	);

	snd = CombC.ar(snd);
	// snd = CombN.ar(snd, 0.5, SinOsc.ar(0.3).range(0.1, 0.2), 5);
	snd = Decay.ar(snd);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

Ndef.clear(10);





//========================
// Acceptance
//========================

// Maj6 chord

(
Ndef(\acceptance).fadeTime = 2;
Ndef(\acceptance, {
	var snd, freq;

	freq = 60;

	snd = SinOsc.ar(
		freq: freq * [1, 2],
		mul: 0.1
	);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


Ndef.clear(10);

// ++ code copied from josh
(
Ndef(\dorian2, {
	var snd, freq, env, trig, gate, array;

	trig = Dust.kr(0.75, 2, -1) * LocalIn.ar;
	trig = Env.linen(0, 1/3.5, 0).ar(doneAction: 0, gate: trig);
	env = Env.perc(0.001, 3, 0.5, -4).ar(doneAction: 0, gate: trig);

	LocalOut.ar(1 - trig);

	array = [16, 19, 21, 24, 29, 32];


	freq = TChoose.kr(trig, array);
	freq = freq/16;
	snd = SinOsc.ar(240 * freq, 0, env);
	snd = (CombN.ar(snd, 0.5, 0.5, 5) * LFNoise2.ar(3).range(0.25, 0.5)) + (CombN.ar(snd, 0.75, 0.75, 5) * LFNoise2.ar(3).range(0.25, 0.5));
	snd = LPF.ar(snd.softclip, 360);
}).play;
)
// -- end of copied code

Ndef.clear(10);

