enumerating
do: elementBlock separatedBy: separatorBlock
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == firstNode ifFalse: [ separatorBlock value ].
			elementBlock value: current value.
			current := current nextNode ]