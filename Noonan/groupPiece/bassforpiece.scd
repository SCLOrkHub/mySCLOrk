(
Ndef(\bass).fadeTime = 4;
Ndef(\bass, {
	var freq, snd, snd2, harmonics, amplitudes;

	freq=(37).midicps;

	harmonics = [0.99, 1, 1.01, 2, 1.99, 2.99, 3.0, 4.0, 4.999, 6.0];
	amplitudes = [0.1, 0.9, 0.2, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

		snd = Saw.ar(freq * harmonics, amplitudes*0.25);
	snd2 = SinOsc.ar(freq); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.5) + (snd2 * 0.4);

	snd = HPF.ar(snd, 50);

	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd)), 0.5);
	snd = LeakDC.ar(snd);
}).play;
)

(
Ndef(\bass).fadeTime = 8;
Ndef(\bass, {
	var freq, snd, snd2, harmonics, amplitudes;

	freq=(37).midicps;

	harmonics = [0.9, 1, 1.1, 2, 1.9, 2.9, 3.1, 4.1, 4.9, 6.0];
	amplitudes = [0.1, 0.9, 0.2, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

	snd = Saw.ar(freq * harmonics, amplitudes*0.25);
	snd2 = SinOsc.ar([freq-7, freq, freq+5, freq+11]); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.5) + (snd2 * 0.5);

	snd = HPF.ar(snd, 50);

	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd)), 0.5);
	snd = LeakDC.ar(snd);
}).play;
)

(
// for live coding
Ndef(\bass).fadeTime = 16;
Ndef(\bass, {
	var freq, snd, snd2, harmonics, amplitudes;

	freq=(37).midicps;

	harmonics = [0.8, 1, 1.1, 2, 1.7, 2.7, 3.1, 4.3, 4.6, 6.4];
	amplitudes = [0.1, 0.9, 0.2, 0.25, 0.25, 0.2, 0.2, 0.15, 0.1, 0.05];

	snd = Saw.ar(freq * harmonics, amplitudes*0.25);
	snd2 = SinOsc.ar([freq-5, freq, freq+3, freq+7]); // * LFTri.ar(5).range(0, 1);

	snd = (snd * 0.5) + (snd2 * 0.2);

	snd = HPF.ar(snd, 50);

	snd = Limiter.ar(LeakDC.ar(Mix.ar(snd)), 0.5);
	snd = LeakDC.ar(snd);
}).play;
)
Ndef(\bass).stop;