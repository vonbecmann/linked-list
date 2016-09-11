copying
postCopy
	| node |
	super postCopy.
	firstNode
		ifNotNil: [ 
			node := firstNode := firstNode copy.
			[ node nextNode isNil ] whileFalse: [ node nextNode: (node := node nextNode copy) ].
			lastNode := node ]