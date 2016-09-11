removing
removeHead
	"Remove the head and answer it. If the receiver is empty, create 
	an error notification."

	^ firstNode
		ifNil: [ self emptyError ]
		ifNotNil: [ | head oldNode |
			head := firstNode value.
			oldNode := firstNode.
			firstNode := firstNode == lastNode
				ifTrue: [ lastNode := nil ]
				ifFalse: [ oldNode nextNode ].
			oldNode nextNode: nil.
			tally := tally - 1.
			head ]