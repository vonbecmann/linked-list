test
testSize
	
	| aStack |
	aStack := self empty.
	self assert: aStack size equals: 0.
	aStack push: 'a'.
	self assert: aStack size equals: 1.
	aStack push: 'b'.
	self assert: aStack size equals: 2.
	aStack pop.
	self assert: aStack size equals: 1.
	aStack pop.
	self assert: aStack size equals: 0.

 
	


