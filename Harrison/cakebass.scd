

// ++ code copied from bruno
(
Ndef(\a).fadeTime = 1;
Ndef(\a, {
	var cake = 9;
	SinOsc.ar(
		freq: 30 * cake,
		mul: LFPulse.ar(cake).range(0, 1)
	)
}).play;
)
// -- end of copied code
