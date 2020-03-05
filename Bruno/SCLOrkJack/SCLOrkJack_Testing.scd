SCLOrkJack.listPorts;

SCLOrkJack.collectPorts;

SCLOrkJack.listRawConnections;

SCLOrkJack.collectConnections;



SCLOrkJack.isAvailable("PulseAudio JACK Source:front-left");

SCLOrkJack.list;

SCLOrkJack.connect(from: "PulseAudio JACK Sink:front-left", to: "system:playback_1");

SCLOrkJack.disconnect(from: "PulseAudio JACK Sink:front-left", to: "system:playback_1");

// wrong port name throws a warning
SCLOrkJack.disconnect(from: "wow", to: "system:playback_1");

// disconnect all existing connections (audio and midi)
SCLOrkJack.disconnectAll;

