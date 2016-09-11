tests
testRemoveAll
	| copied |
	queue nextPut: 1.
	queue nextPut: 2.
	queue nextPut: 3.
	queue nextPut: 4.
	copied := queue copy.
	self assert: queue size equals: 4.
	queue removeAll.
	self assert: queue size equals: 0.
	self assert: copied size equals: 4