// SCLOrk QuNeo for "Wake Up"
q = SCLOrkQuNeo.new.preset(\toggle);
q = SCLOrkQuNeo.new;
SCLOrkChat.new("jia");
(
q.onButtonChange = { |velocity, midinote|
	["BUTTON!", velocity, midinote].postln
};
)
"WakeUpNdefs.scd".loadRelative;

// ===============
// BUTTON ACTIONS & LABELS
// ===============
(
q.onButtonChange = { | velocity, midinote |
	var synth;

	switch(midinote,

		// =========
		// OBJECT 1 - PITCH VAR
		// =========
		36, {
			if(velocity>0, {
				Ndef(\childrenlaugh,
					[
						\in, ~micBus,
						\out, ~fxBus
					],
					target: ~objects[midinote]);
			}, {
				~objects[midinote].release(2);
			});
		},