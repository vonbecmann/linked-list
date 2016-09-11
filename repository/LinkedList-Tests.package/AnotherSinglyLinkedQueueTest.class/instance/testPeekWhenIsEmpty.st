tests
testPeekWhenIsEmpty
	self assert: queue isEmpty.
	self assert: queue peek isNil