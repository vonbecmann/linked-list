test
testTop
	| aStack |
	aStack := self empty.
	self assert: aStack isEmpty.
	aStack push: 'a'.
	aStack push: 'b'.
	self assert: aStack top equals: 'b'.
	self assert: aStack top equals: 'b'.
	self assert: aStack size equals: 2