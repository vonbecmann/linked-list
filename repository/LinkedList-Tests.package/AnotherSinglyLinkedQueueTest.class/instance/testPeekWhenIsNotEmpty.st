tests
testPeekWhenIsNotEmpty
	self assert: queue isEmpty.
	queue nextPut: 1.
	queue nextPut: 12.
	self deny: queue isEmpty.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 1.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 1