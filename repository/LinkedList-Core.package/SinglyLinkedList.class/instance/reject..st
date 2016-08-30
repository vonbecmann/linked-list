enumerating
reject: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver only those elements for 
	which aBlock evaluates to false. Answer the new collection."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(aBlock value: current value)
				ifFalse: [ newCollection add: current value ].
			current := current nextNode ].
	^ newCollection