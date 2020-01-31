(
Ndef(\denial).fadeTime = 1;
Ndef(\denial, {
	var snd, freq;

	freq = [22, 69, 65, 75, 74].choose.midicps

	env = Env.asr

	snd = Pulse.ar(freq: freq, width: 0.5),
	