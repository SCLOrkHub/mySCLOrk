SCLOrkChat.new("tanya");
"tanya".postln;


// GUI FOR NDEFs FUCK SO COOL

// create a window for a given Ndef
Ndef(\sound).edit
(
Ndef(\sound, { |freq = 440, rate = 2|
    SinOsc.ar(freq * [1, 1.625]) * SinOsc.kr(rate).max(0) * 0.2
}).play;
)

// set lags for controls:
Ndef(\sound).lag(\freq, 0.2, \rate, 0.5);
Ndef(\sound).clear(1);

// create a mixer for all Ndefs:
NdefMixer(s);

