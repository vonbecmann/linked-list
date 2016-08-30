enumerating
select: selectBlock thenCollect: collectBlock
	"Utility method to improve readability."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(selectBlock value: current value)
				ifTrue: [ newCollection add: (collectBlock value: current value) ].
			current := current nextNode ].
	^ newCollection