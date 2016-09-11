tests
testRemoveHeadWhenIsEmpty
	self assert: queue isEmpty.
	self should: [ queue removeHead ] raise: Error