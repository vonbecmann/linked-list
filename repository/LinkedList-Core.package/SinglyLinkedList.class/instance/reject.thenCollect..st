enumerating
reject: rejectBlock thenCollect: collectBlock
	"Utility method to improve readability."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(rejectBlock value: current value)
				ifFalse: [ newCollection add: (collectBlock value: current value) ].
			current := current nextNode ].
	^ newCollection