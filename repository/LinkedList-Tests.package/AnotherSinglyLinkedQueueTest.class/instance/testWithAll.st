tests
testWithAll
	| q |
	q := SinglyLinkedQueue withAll: (11 to: 21).
	self assert: q size equals: 11.
	self assert: q head equals: 11