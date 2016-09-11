tests
testSize
	self assert: queue isEmpty.

	#(1 2 3 4 5 6 7 8 9 10) do: [ :each | queue nextPut: each ].

	self deny: queue isEmpty.
	self assert: queue size equals: 10