tests
testAsArray
	queue
		nextPut: 1;
		nextPut: 2;
		nextPut: 3;
		nextPut: 4.
	self assert: queue size equals: 4.
	self assert: queue asArray equals: #(1 2 3 4)