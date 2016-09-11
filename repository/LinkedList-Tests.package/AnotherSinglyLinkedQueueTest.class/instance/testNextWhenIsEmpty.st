tests
testNextWhenIsEmpty
	self assert: queue isEmpty.
	self assert: queue next isNil