accessing
nextPut: anObject
	"Insert the argument, anObject, as the next object accessible by the 
	receiver. Answer anObject."

	| node |
	node := SinglyLinkedNode with: anObject.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject