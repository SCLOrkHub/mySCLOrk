SCLOrkChat.new("aastha");

q = SCLOrkQuNeo.new;

(
q.onButtonChange = { |velocity, midinote| ["BUTTON!", velocity, midinote].postln

};
)