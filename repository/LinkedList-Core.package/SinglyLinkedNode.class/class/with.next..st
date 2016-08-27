instance creation
with: anObject next: aNode
	"a singly linked node with an object as its value and a node as its successor"

	^ (self with: anObject)
		nextNode: aNode;
		yourself