tests
testPop03

	| res elem |
	elem := 'anElement'.	
	self assert: stack isEmpty.
	
	stack push: 'a'.
	stack push: elem.
	res := stack pop.	
	self assert: res equals: elem.
	self assert: res == elem.
	
	self assert: stack size equals: 1.
	stack pop.
	self assert: stack isEmpty.

