
SCLOrkChat.new("samiam");


// ==================================
// Sync *without* SCLOrkClock
//
// There are many ways to sync laptops over the network.
// In the future the plan is to always use SCLOrkClock, but it is now working yet.
//
// The code below shows an alternative method that does NOT use SCLOrkClock.
// The basic idea is: a 'conductor' laptop sends a single OSC message
// through the network to simultaneously start TempoClocks on other laptops.
//
// This file is intended to be used by all players (not conductor).
//
// During class, Bruno will run the conductor file.
// In small group rehearsals, one group member should assume the role of conductor
// and use the OTHER file labeled "CLOCK SENDER"
// ==================================


// ===========================================
// 1. OSCdef - you only have to run this ONLY ONCE (unless you have to restart SC)
// This code makes SuperCollider "listen" for a start clock message from a conductor's laptop
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


// ============================================
// 2. Try the examples in the file "TempoClock_Demo_Patterns" from sccode
//
// You should not need to come back to this file, as the OSCdef is set to survive control period.
// If SuperCollider crashes and you have to restart, then reopen and re-run the contents of this file.
// You conductor will need to send a new "ON" message to everyone.