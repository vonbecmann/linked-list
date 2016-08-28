adding
push: anObject
	"Adds a new object of any kind on top of the stack."

	firstNode := SinglyLinkedNode with: anObject next: firstNode.
	tally := tally + 1.
	^ anObject