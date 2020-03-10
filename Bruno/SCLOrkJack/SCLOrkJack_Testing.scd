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
SCLOrkJack.collectTypes;
SCLOrkJack.collectSources;

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
SCLOrkJack.connectAllFrom( List[ List[ "system:capture_1", "SuperCollider:in_1" ], List[ "system:capture_2", "SuperCollider:in_2" ], List[ "PulseAudio JACK Sink:front-left", "system:playback_1" ], List[ "PulseAudio JACK Sink:front-right", "system:playback_2" ], List[ "aeolus:out.L", "system:playback_1" ], List[ "aeolus:out.R", "system:playback_2" ], List[ "a2j:Virtual Keyboard [130] (capture): Virtual Keyboard", "aeolus:Midi/in" ], List[ "SuperCollider:out_1", "system:playback_1" ], List[ "SuperCollider:out_2", "system:playback_2" ] ] );

SCLOrkJack.preset(\quneo);


// next step: create a few internal, SCLOrk-specific presets
// for example,

// SCLOrkJack.preset(\quneo); // should connect any available quneo to SC in/out
// SCLOrkJack.preset(\nano); // should connect any available quneo to SC in/out
// SCLOrkJack.preset(\rec); // should connect SC out 1 to system playback 2


// also: when saving a preset, sometimes a QuNeo port may show up with different number in another laptop. Build in a way to account for that.
// in other words -- at moment of "load file" there must be a check. If port not found, check if there is another similar name (contains quneo, etc). Or make it explicit to midi ports that have a nubmer [].
