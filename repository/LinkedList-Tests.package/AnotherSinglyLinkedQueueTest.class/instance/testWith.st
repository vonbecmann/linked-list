tests
testWith
	| q |
	q := SinglyLinkedQueue with: 7.9.
	self assert: q size equals: 1.
	self assert: q head equals: 7.9