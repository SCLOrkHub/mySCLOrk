//========================================================//
 //                                                        //
//                        GRIEF                           //
 //                                                        //
//========================================================//



/*
Live Performance Piece
By Jonathan Claridad, Josh Mitchell, Lucas Moreira



*/











//=========================
// Denial
//=========================

// short percussive bursts of sound
// perhaps like something is going to start, but stops abruptly

(
Ndef(\denial, {
	var snd, env;

	snd = WhiteNoise.ar;
	snd = RLPF.ar(snd, 440);

	env = Env.perc(0.01, 0.5);

	snd = snd * env;

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)







//=========================
// Bargaining
//=========================

// two frequencies moving in and out of sync, playing with beatings

(
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(500, 1500).round(150);
	maxwidth = 100;

	snd = LFTri.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)

// edited version

// ++ code copied from josh
(
Ndef(\bargaining, {
	var snd, freq, maxwidth;

	freq = MouseY.kr(500, 100) * LFNoise0.ar(10).range(1, 2);
	maxwidth = 100;

	snd = LFTri.ar(
		freq: [(freq + MouseX.kr(0, maxwidth)), (freq - MouseX.kr(0, maxwidth))],
		mul: 0.1
	);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
// -- end of copied code










//==========================
// Depression
//==========================

// long release notes picked randomly from the dorian scale

(
Ndef(\depression, {
	var snd, env, freq;

	freq = 60;


	snd = SinOsc.ar(freq: freq);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)






//=======================
// Anger
//=======================

// bubbling washes of sound
// OR
// sporadic lines of notes with short att and rel

(
Ndef(\anger, {
	var snd, freq, width;

	width = MouseY.kr(100, 1000);

	freq = SinOsc.ar(7).range((width - 50), (width + 50));
	freq = [freq, (freq * 2), (freq * 3), (freq / 2)];


	snd = Saw.ar(
		freq: freq,
		mul: 0.1
	);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)


(
Ndef(\anger, {
	var snd, freq, width;

	width = MouseY.kr(100, 1000);

	freq = SinOsc.ar(7).range((width - 50), (width + 50)) ;
	freq = [freq, (freq * 2), (freq * 3), (freq / 2)] ;


	snd = Saw.ar(
		freq: freq * LFNoise0.ar(15).range(1, 10),
		mul: 0.1
	);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)






//========================
// Acceptance
//========================

// Maj6 chord

(
Ndef(\acceptance, {
	var snd;

	snd = SinOsc.ar(
		freq: 60,
		mul: 0.1
	);


	snd = Limiter.ar(Mix.ar(snd));
}).play;
)




