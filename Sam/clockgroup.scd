
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


// ==================================
// Sync *without* SCLOrkClock
//
// This file is intended to be used by ONE CONDUCTOR ONLY.
//
// During class, Bruno will run the conductor ("clock sender") file.
// In small group rehearsals, one group member should assume the role of conductor
// and use the THIS FILE (not the receiver file)
// ==================================


// ================================
// 1. Create a list of players that are going to participate
// NOTE: in ~destinationList, COMMENT OUT laptops who are not in your group)
// You only have to run this block ONCE (unless you restart SuperCollider)
(
~tryHostname = { |hostname|
	try { var n = NetAddr.new(hostname, 57120); (hostname ++ " successfully connected!").postln; n } { |error|
		(hostname ++ " is not available").postln;
		nil // return nil if hostname is not found
	}
};

~destinationList =  [
	"sclork-02.local",
	"sclork-08.local"
].collect({ |hostname| ~tryHostname.value(hostname) });
)

// ================================
// 2. Here are the commands that you can send to your peers.
// Make sure your peers have already run their OSCdef listeners
// *before* you send these messages.

// START METRONOMES (you can pick a BPM other than 60 if you like)
(
var bpm = 80;
~destinationList.do({ |ip|
	if(ip.notNil, {
		ip.sendMsg('metronome', \on, bpm); // message to connected
	});
});
// create a local clock for yourself as well
~clock = TempoClock.new(bpm/60).permanent_(true);
)


// CHANGE BPM (this will instantly change tempo on currently running TempoClocks)
(
var bpm = 80;
~destinationList.do({ |ip|
	if(ip.notNil, {
		ip.sendMsg('metronome', \change, bpm); // message to connected peers
	});
});
~clock.tempo = bpm/60;
)


// STOP METRONOMES (you don't really have to use this, it's OK to leave them on).
(
~destinationList.do({ |ip|
	if(ip.notNil, {
		ip.sendMsg('metronome', \off);
	});
});
~clock.stop;
)