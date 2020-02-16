(
Ndef(\bass).fadeTime = 4;
Ndef(\bass, {
	var freq, snd, snd2, harmonics, amplitudes;

	freq=(37).midicps;

	harmonics = [0.9, 1, 1.3, 2.2, 1.7, 2.7, 3.2, 4.2, 4.9, 6.4];
	amplitudes = [0.1, 0.9, 0.2, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

	snd = Saw.ar(freq * harmonics, amplitudes*0.5);
	snd2 = SinOsc.ar([freq, freq+4]); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.8) + (snd2 * 0.2);

	snd = HPF.ar(snd, 50);

	snd = Limiter.ar(Mix.ar(snd));
}).play;
)
Ndef(\bass).stop;