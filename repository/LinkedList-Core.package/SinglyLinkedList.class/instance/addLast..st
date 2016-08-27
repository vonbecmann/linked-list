adding
addLast: anObject
	"Add a node to the end of the receiver's list."

	| node |
	node := SinglyLinkedNode with: anObject.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject