tests
testNextWhenIsNotEmpty
	self assert: queue isEmpty.
	queue nextPut: 1.
	queue nextPut: 12.
	self deny: queue isEmpty.
	self assert: queue next equals: 1.
	self assert: queue next equals: 12.
	self assert: queue next isNil