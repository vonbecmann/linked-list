tests
testAsArray
	stack
		push: 1;
		push: 2;
		push: 3;
		push: 4.
	self assert: stack size equals: 4.
	self assert: stack asArray equals: #(4 3 2 1)