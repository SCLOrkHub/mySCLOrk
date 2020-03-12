(
Ndef(\combs1, {
	var env, snd;

	env = Env.perc(
	        	attackTime: 0.001,
	         	releaseTime: 0.5,
	        	curve: -6
        	).ar;

	snd = SinOsc.ar(freq: 240, mul: env * 0.5);

	snd = CombN.ar(
		in: ,
		maxdelaytime: ,
		delaytime: ,
		decaytime: ,
		mul:
	); 