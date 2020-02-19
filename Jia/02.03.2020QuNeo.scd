q = SCLOrkQuNeo.new;
SCLOrkChat.new("jia");
(
q.onButtonChange = { |velocity, midinote|
	["BUTTON!", velocity, midinote].postln
};
)