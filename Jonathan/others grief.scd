SCLOrkChat.new("SickJon");


// ++ code copied from josh
(
Ndef(\denial1).fadeTime = 5;
Ndef(\denial1, {
	var snd, freq, env, trig, gate, array;

	trig = Dust.kr(5, 2, -1) * LocalIn.ar;
	trig = Env.linen(0, 1/5, 0).ar(doneAction: 0, gate: trig);
	env = Env.perc(0.001, 3, 0.5, -4).ar(doneAction: 0, gate: trig);

	LocalOut.ar(1 - trig);

	array = [16, 19, 21, 24, 29, 32];

	freq = TChoose.kr(trig, array);
	freq = freq/16;

	snd = SinOsc.ar(240 * freq, 0, env);
	snd = (CombN.ar(snd, 0.5, 0.5, 5) * LFNoise2.ar(3).range(0.25, 0.5)) + (CombN.ar(snd, 0.75, 0.75, 5) * LFNoise2.ar(3).range(0.25, 0.5));
	snd = LPF.ar(snd.tanh, 7200).softclip;
})
// -- end of copied code

// ++ code copied from josh
(
Ndef(\denial1).fadeTime = 5;
Ndef(\denial1, {
	var snd, freq, env, trig, gate, array;

	trig = Dust.kr(5, 2, -1) * LocalIn.ar;
	trig = Env.linen(0, 1/5, 0).ar(doneAction: 0, gate: trig);
	env = Env.perc(0.001, 3, 0.5, -4).ar(doneAction: 0, gate: trig);

	LocalOut.ar(1 - trig);

	array = [16, 19, 21, 24, 29, 32];

	freq = TChoose.kr(trig, array);
	freq = freq/16;

	snd = SinOsc.ar(240 * freq, 0, env);
	snd = (CombN.ar(snd, 0.5, 0.5, 5) * LFNoise2.ar(3).range(0.25, 0.5)) + (CombN.ar(snd, 0.75, 0.75, 5) * LFNoise2.ar(3).range(0.25, 0.5));
	snd = LPF.ar(snd.tanh, 7200).softclip;
}).play;
)
// -- end of copied code

// ++ code copied from Lucas
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
// -- end of copied code

// ++ code copied from josh
snd = CombC.ar(snd, 0.4, Slew.ar(LFNoise0.ar(2).range(0.1, 0.3), 20, 20), 5);

// -- end of copied code
