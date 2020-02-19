SCLOrkChat.new("nicole")

// =====================================================
// Play on QuNeo
// (buttons 36, 37, 38, 39, 40 will activate corresponding Pbindefs)
// Use "toggle" mode in SCLOrkQuNeo GUI
// =====================================================

(
q.onButtonChange = { |velocity, midinote|
	// if velocity is greater than zero, play sample; otherwise, just ignore if velocity = 0
	// first QuNeo button (36) will play sample at index 0
	// 37 plays sample at index 1
	// 38 plays sample at index 2
	// etc
	if(velocity>0, {
		if(midinote>40, {
			var index = midinote - 41;
			if(~samples[index].notNil, {
				~samples[index].play;
				["Button", midinote, "Index", index].postln;
				PathName(~samples[index].path).fileName.postln;
			})
			}, {
				Pbindef(midinote.asSymbol).play(~clock, quant: 4).quant = 4;
				["Button", midinote].postln;
			})
	}, {
			// when velocity = 0,
		if(midinote>40, { "do nothing" }, { Pbindef(midinote.asSymbol).stop;  })
	})
}
);