removing
removeFirst
	"Remove the first element and answer it. If the receiver is empty, create 
	an error notification."

	| firstElement oldNode |
	firstElement := self first.
	oldNode := firstNode.
	firstNode := firstNode == lastNode
		ifTrue: [ lastNode := nil ]
		ifFalse: [ oldNode nextNode ].
	oldNode nextNode: nil.
	tally := tally - 1.
	^ firstElement