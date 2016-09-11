tests
testHeadWhenIsEmpty
	self assert: queue isEmpty.
	self should: [ queue head ] raise: Error