adding
addFirst: anObject
	"Add a node to the beginning of the receiver's list."

	| node |
	node := SinglyLinkedNode with: anObject next: firstNode.
	firstNode ifNil: [ lastNode := node ].
	firstNode := node.
	tally := tally + 1.
	^ anObject