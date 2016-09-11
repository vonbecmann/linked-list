enumerating
do: aBlock
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextNode ]