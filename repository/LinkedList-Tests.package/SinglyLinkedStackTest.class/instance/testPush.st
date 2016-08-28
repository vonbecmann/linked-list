test
testPush
	
	| aStack |
	aStack := self empty.
	aStack push: 'a'.
	self assert: aStack size equals: 1.	
	aStack push: 'b'.
	self assert: aStack size equals: 2.
	