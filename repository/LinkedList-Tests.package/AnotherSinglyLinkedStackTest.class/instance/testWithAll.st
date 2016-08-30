tests
testWithAll
	| newStack |
	newStack := SinglyLinkedStack withAll: (11 to: 21).
	self assert: newStack size equals: 11.
	self assert: newStack top equals: 21