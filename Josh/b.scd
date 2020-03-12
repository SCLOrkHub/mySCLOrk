(
Ndef( \den2, {
	var env, snd, freqa, freqb;
	freqa = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].choose;
	freqb = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].choose;
	//freqb = freqa + 4;
	env = Env.perc(0.01, 2).ar;
	snd = LFPar.ar(240 * [2.pow(freqa/12), 2.pow(freqb/12)], [0, 0.7pi], [1, 0.5] * env);
	snd = CombN.ar(snd, 0.3, 0.3, 3);
	snd = Mix.ar(snd);
	snd = (snd.tanh * snd.tanh) * 10;
	snd = LeakDC.ar(Limiter.ar(Mix.ar(snd)));
}).play;
)


