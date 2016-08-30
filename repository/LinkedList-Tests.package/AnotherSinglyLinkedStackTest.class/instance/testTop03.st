tests
testTop03
	self assert: stack isEmpty.
	stack push: 'a'.
	stack push: 'b'.
	self assert: stack top equals: 'b'.
	self assert: stack top equals: 'b'.
	self assert: stack size equals: 2