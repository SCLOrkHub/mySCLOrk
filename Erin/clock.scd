SCLOrkChat.new("erin");


// ++ code copied from tan
(
OSCdef(\startClock, { |msg|
	msg.postln;
	// turn it on at bpm
	if(msg[1]==\on, {
		~clock = TempoClock.new(msg[2]/60).permanent_(true)
	});
	// turn it off
	if(msg[1]==\off, { ~clock.stop });
	// change tempo
	if(msg[1]==\change, { ~clock.tempo = msg[2]/60 })
},
path: 'metronome'
).permanent_(true);
)
// -- end of copied code
