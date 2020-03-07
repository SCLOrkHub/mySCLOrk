// opens dialog box, save snapshot of all current connections into a file
SCLOrkJack.saveCurrentConnections;


// if path not provided, opens a dialog box to select preset file
SCLOrkJack.loadConnectionsFromFile;

// note: the operation above will not disconnect any existing connections.
// it will just add connections from preset on top of what's already connected.
// If you want to 'clean up the mess' before loading a fresh new preset, use this before:

SCLOrkJack.disconnectAll;





// other methods available

// Print info on Post Window
SCLOrkJack.list;
SCLOrkJack.listPorts;
SCLOrkJack.listSources;
SCLOrkJack.listDestinations;
SCLOrkJack.listConnections;
SCLOrkJack.listProperties;
SCLOrkJack.listTypes;


// Collect data into arrays
SCLOrkJack.collectPorts;
SCLOrkJack.collectConnections;
SCLOrkJack.collectProperties;
SCLOrkJack.collectSources;

~wow
~wow2.includes(~wow[2]);
~wow2 = SCLOrkJack.collectSources.collect({ |i| i.asSymbol });

SCLOrkJack.isAvailable("PulseAudio JACK Source:front-left");

SCLOrkJack.connect(from: "PulseAudio JACK Sink:front-left", to: "system:playback_1");

SCLOrkJack.disconnect(from: "PulseAudio JACK Sink:front-left", to: "system:playback_1");

// wrong port name throws a warning
SCLOrkJack.disconnect(from: "banana:mic1", to: "system:playback_1");

// disconnect all existing connections (audio and midi)
SCLOrkJack.disconnectAll;

// opens dialog box, save snapshot of all current connections into a file
SCLOrkJack.saveCurrentConnections;

// if path not provided, opens a dialog box to select preset file
SCLOrkJack.loadConnectionsFromFile;

// directly using an array of connections:
SCLOrkJack.connectAllFrom( [ "system:capture_1", [ "SuperCollider:in_1" ], "system:capture_2", [ "SuperCollider:in_2" ], "system:playback_1", [ "PulseAudio JACK Sink:front-left", "yoshimi:left", "SuperCollider:out_1" ], "system:playback_2", [ "PulseAudio JACK Sink:front-right", "yoshimi:right", "SuperCollider:out_1" ], "PulseAudio JACK Sink:front-left", [ "system:playback_1" ], "PulseAudio JACK Sink:front-right", [ "system:playback_2" ], "PulseAudio JACK Source:front-left", "PulseAudio JACK Source:front-right", "a2j:Midi Through [14] (capture): Midi Through Port-0", "a2j:Midi Through [14] (playback): Midi Through Port-0", "yoshimi:left", [ "system:playback_1" ], "yoshimi:right", [ "system:playback_2" ], "yoshimi:midi in", [ "a2j:nanoKONTROL2 [20] (capture): nanoKONTROL2 MIDI 1" ], "SuperCollider:in_1", [ "system:capture_1" ], "SuperCollider:in_2", [ "system:capture_2" ], "SuperCollider:out_1", [ "system:playback_1", "system:playback_2" ], "SuperCollider:out_2", "a2j:nanoKONTROL2 [20] (capture): nanoKONTROL2 MIDI 1", [ "yoshimi:midi in" ], "a2j:nanoKONTROL2 [20] (playback): nanoKONTROL2 MIDI 1" ]);




// next step: create a few internal, SCLOrk-specific presets
// for example,

// SCLOrkJack.preset(\quneo); // should connect any available quneo to SC in/out
// SCLOrkJack.preset(\nano); // should connect any available quneo to SC in/out
// SCLOrkJack.preset(\rec); // should connect SC out 1 to system playback 2
