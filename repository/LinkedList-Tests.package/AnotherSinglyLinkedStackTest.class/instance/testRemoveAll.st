tests
testRemoveAll
	| copied |
	stack push: 1.
	stack push: 2.
	stack push: 3.
	stack push: 4.
	copied := stack copy.
	self assert: stack size equals: 4.
	stack removeAll.
	self assert: stack size equals: 0.
	self assert: copied size equals: 4