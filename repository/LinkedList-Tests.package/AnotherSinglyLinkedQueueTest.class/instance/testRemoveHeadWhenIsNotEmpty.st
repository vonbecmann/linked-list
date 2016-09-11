tests
testRemoveHeadWhenIsNotEmpty
	self assert: queue isEmpty.
	queue nextPut: 83.
	queue nextPut: 42.
	self deny: queue isEmpty.
	self assert: queue size equals: 2.

	self assert: queue removeHead equals: 83.
	self assert: queue size equals: 1.

	self assert: queue removeHead equals: 42.
	self assert: queue isEmpty.
	self assert: queue size equals: 0.