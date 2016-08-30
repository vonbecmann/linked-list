tests
testPush02
	stack push: 'a'.
	self assert: stack size equals: 1.
	stack push: 'b'.
	self assert: stack size equals: 2