accessing
next
	"Answer the next object accessible by the receiver."

	^ firstNode
		ifNil: [ nil ]
		ifNotNil: [ | head oldNode |
			head := firstNode value.
			oldNode := firstNode.
			firstNode := firstNode == lastNode
				ifTrue: [ lastNode := nil ]
				ifFalse: [ oldNode nextNode ].
			oldNode nextNode: nil.
			tally := tally - 1.
			head ]