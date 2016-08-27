tests
testAsString
	self assert: (SinglyLinkedNode with: 1) asString equals: 'SinglyLinkedNode(1)'.
	self assert: (SinglyLinkedNode with: 1 next: nil) asString equals: 'SinglyLinkedNode(1)'