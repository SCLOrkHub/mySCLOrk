(
~destinationList = [
	NetAddr.new("127.0.0.1", 57120),
	NetAddr.new("sclork-01.local", 57120),
	// NetAddr.new("sclork-02.local", 57120),
	// NetAddr.new("sclork-03.local", 57120),
	// NetAddr.new("sclork-04.local", 57120),
	// NetAddr.new("sclork-05.local", 57120),
	// NetAddr.new("sclork-06.local", 57120),
	// NetAddr.new("sclork-07.local", 57120),
	// NetAddr.new("sclork-08.local", 57120),
	// NetAddr.new("sclork-09.local", 57120),
	// NetAddr.new("sclork-10.local", 57120),
	// NetAddr.new("sclork-11.local", 57120),
	// NetAddr.new("sclork-12.local", 57120),
	NetAddr.new("sclork-13.local", 57120),
	// NetAddr.new("sclork-14.local", 57120),
	// NetAddr.new("sclork-15.local", 57120),
];
)

(
~destinationList.do({ |ip|
	ip.sendMsg('metronome', \on, 60);
});
)

(
~destinationList.do({ |ip|
	ip.sendMsg('metronome', \off);
});
)

(
~destinationList.do({ |ip|
	ip.sendMsg('metronome', \change, 60);
});
)







