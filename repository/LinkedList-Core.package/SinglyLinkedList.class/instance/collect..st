enumerating
collect: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			newCollection add: (aBlock value: current value).
			current := current nextNode ].
	^ newCollection