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
	"sclork-01.local",
	"sclork-02.local",
	"sclork-03.local",
	"sclork-04.local",
	"sclork-05.local",
	"sclork-06.local",
	"sclork-07.local",
	"sclork-08.local",
	"sclork-09.local",
	"sclork-10.local",
	"sclork-11.local",
	"sclork-12.local",
	"sclork-13.local",
	"sclork-14.local",
	"sclork-15.local",
	"sclork-16.local"
].collect({ |hostname| ~tryHostname.value(hostname) });
)

// ================================
// 2. Here are the commands that you can send to your peers.
// Make sure your peers have already run their OSCdef listeners
// *before* you send these messages.

// START METRONOMES (you can pick a BPM other than 60 if you like)
(
var bpm = 60;
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
var bpm = 90;
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