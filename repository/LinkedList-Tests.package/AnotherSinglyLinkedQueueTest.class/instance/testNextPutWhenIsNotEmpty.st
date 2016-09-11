tests
testNextPutWhenIsNotEmpty
	self assert: queue isEmpty.

	queue nextPut: 83.
	queue nextPut: 42.

	self deny: queue isEmpty.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 83