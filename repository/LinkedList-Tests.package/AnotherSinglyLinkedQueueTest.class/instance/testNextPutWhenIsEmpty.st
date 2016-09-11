tests
testNextPutWhenIsEmpty
	self assert: queue isEmpty.
	queue nextPut: 43.
	self deny: queue isEmpty.
	self assert: queue size equals: 1.
	self assert: queue peek equals: 43