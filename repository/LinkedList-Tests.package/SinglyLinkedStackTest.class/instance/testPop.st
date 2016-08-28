test
testPop

	| aStack res elem |
	elem := 'anElement'.	
	aStack := self empty.
	self assert: aStack isEmpty.
	
	aStack push: 'a'.
	aStack push: elem.
	res := aStack pop.	
	self assert: res equals: elem.
	self assert: res == elem.
	
	self assert: aStack size equals: 1.
	aStack pop.
	self assert: aStack isEmpty.

