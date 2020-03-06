// Jonathan -- give this a try

SCLOrkJack.list;

// 1. Make all the connections you need for Toccata (midi keyboard, QuNeo, Zyn etc... all audio and MIDI connections as needed in Jack)

// 2. Once you are sure all connections are in place, try this:
// opens dialog box, save snapshot of all current connections into a file
// give it a name like "jonathan_toccata_jack_connections.scd" or whatever (make sure to use extension .scd)
SCLOrkJack.saveCurrentConnections;



// Now if all went well, next time you set up toccata, after plugging all hardware (QuNeo, keyboard) and opening all needed software (Zyn, SuperCollider, start toccata code), you can run this line to bring back your saved connections:
SCLOrkJack.loadConnectionsFromFile;

// note: the operation above will not disconnect any existing connections.
// it will just add connections on top of what's already connected.
// If you want to 'clean up the mess' before loading a fresh new preset, use this before:

SCLOrkJack.disconnectAll;
