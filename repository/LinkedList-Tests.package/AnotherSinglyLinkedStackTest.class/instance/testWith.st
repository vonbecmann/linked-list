tests
testWith
	| newStack |
	newStack := SinglyLinkedStack with: 7.9.
	self assert: newStack size equals: 1.
	self assert: newStack top equals: 7.9