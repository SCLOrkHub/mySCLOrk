SCLOrkJack.listRaw;

SCLOrkJack.listRawConnections;

SCLOrkJack.isAvailable("PulseAudio JACK Sink:front-left");

SCLOrkJack.list;


SCLOrkJack.disconnect(from: "yoshimi:left", to: "system:playback_2");























a.occurrencesOf("system:capture_1")

a.sort.do({|i| i.postln})



a = "jack_lsp -c".unixCmdGetStdOutLines;


a[3]
SCLOrkJack.connect(type: "midi", from: "jack-keyboard", to: "yoshimi");




SCLOrkJACK.load(preset: );



a = "jack_lsp -t".unixCmdGetStdOutLines

b = a.clump(2);

(
c = b.collect({ |i|
	var name, type;
	name = i[0];
	type = case
	{i[1].containsi("audio")} {"AUDIO"}
	{i[1].containsi("midi")} {"MIDI"}
	{true} {"UNSURE"};

	(type ++ ": " ++ name).postln;

}).sort;
)

c
"wow".systemCmd;

~listing = "ls -2".unixCmd;

~listing[6]

~listing = "ls -l".unixCmdGetStdOutLines; // Grab
~listing.reverse.as(Array).stutter.join.postln; // Mangle