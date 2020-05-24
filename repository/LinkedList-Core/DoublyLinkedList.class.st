"
i'm a doubly linked list.
a really simple implementation.

"
Class {
	#name : #DoublyLinkedList,
	#superclass : #Object,
	#instVars : [
		'firstNode',
		'lastNode',
		'tally'
	],
	#category : #'LinkedList-Core-Sequenceable'
}

{ #category : #adding }
DoublyLinkedList >> add: anObject [
	^ self addLast: anObject
]

{ #category : #adding }
DoublyLinkedList >> addAll: aCollection [ 
	"Include all the elements of aCollection as the receiver's elements. Answer 
	aCollection. Actually, any object responding to #do: can be used as argument."

	aCollection do: [:each | self add: each].
	^ aCollection
]

{ #category : #adding }
DoublyLinkedList >> addFirst: anObject [
	"Add a node to the beginning of the receiver's list."

	| node |
	node := DoublyLinkedNode with: anObject next: firstNode.
	firstNode ifNil: [ lastNode := node ] ifNotNil: [ firstNode previousNode: node ].
	firstNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #adding }
DoublyLinkedList >> addLast: anObject [
	"Add a node to the end of the receiver's list."

	| node |
	node := DoublyLinkedNode with: anObject previous: lastNode.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #enumerating }
DoublyLinkedList >> allSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self do: [ :each | (aBlock value: each) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
DoublyLinkedList >> anyOne [
	^ self first
]

{ #category : #enumerating }
DoublyLinkedList >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #enumerating }
DoublyLinkedList >> collect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into a collection like the receiver. Answer  
	the new collection."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			newCollection add: (aBlock value: current value).
			current := current nextNode ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> collect: collectBlock thenDo: doBlock [
	"Utility method to improve readability."

	self do: [ :each | doBlock value: (collectBlock value: each) ]
]

{ #category : #enumerating }
DoublyLinkedList >> collect: collectBlock thenSelect: selectBlock [
	"Utility method to improve readability."
	"Optimized version."

	| newCollection newElement |
	newCollection := self class new.
	self
		do: [ :each | 
			newElement := collectBlock value: each.
			(selectBlock value: newElement)
				ifTrue: [ newCollection add: newElement ] ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> detect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true."

	^ self detect: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #enumerating }
DoublyLinkedList >> detect: aBlock ifFound: foundBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock. 
	If no element matches the criteria then do nothing.
	Always returns self to avoid misuse and a potential isNil check on the sender."

	self
		detect: aBlock
		ifFound: foundBlock
		ifNone: [ 
			"Do nothing on purpose"
			 ]
]

{ #category : #enumerating }
DoublyLinkedList >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock and answer the result of this evaluation. 
	If none evaluate to true, then evaluate exceptionBlock."

	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : #enumerating }
DoublyLinkedList >> detect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	^ self detect: aBlock ifFound: [ :element | element ] ifNone: exceptionBlock
]

{ #category : #enumerating }
DoublyLinkedList >> do: aBlock [
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
DoublyLinkedList >> do: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."
	"Optimized."
		
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == firstNode ifFalse: [ separatorBlock value ].
			elementBlock value: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
DoublyLinkedList >> do: aBlock without: anItem [
	"Enumerate all elements in the receiver. 
	Execute aBlock for those elements that are not equal to the given item"

	^ self do: [ :each | anItem = each ifFalse: [ aBlock value: each ] ]
]

{ #category : #private }
DoublyLinkedList >> emptyError [
	^ Error signal: 'collection is empty!'
]

{ #category : #private }
DoublyLinkedList >> errorNotFound: anObject [
	Error
		signal:
			(String
				streamContents: [ :stream | 
					stream print: anObject.
					stream << ' not found in '.
					stream print: self class ])
]

{ #category : #accessing }
DoublyLinkedList >> first [
	"Answer the first element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode ifNil: [ self emptyError ] ifNotNil: [ firstNode value ]
]

{ #category : #testing }
DoublyLinkedList >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
DoublyLinkedList >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
DoublyLinkedList >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
DoublyLinkedList >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
DoublyLinkedList >> includes: anObject [
	"Answer whether anObject is one of the receiver's elements."

	^ self anySatisfy: [ :each | each = anObject ]
]

{ #category : #initialization }
DoublyLinkedList >> initialize [
	super initialize.
	firstNode := lastNode := nil.
	tally := 0
]

{ #category : #enumerating }
DoublyLinkedList >> inject: thisValue into: binaryBlock [
	"Accumulate a running value associated with evaluating the argument, 
	binaryBlock, with the current value of the argument, thisValue, and the 
	receiver as block arguments. For instance, to sum the numeric elements 
	of a collection, aCollection inject: 0 into: [:subTotal :next | subTotal + 
	next]."

	| nextValue |
	nextValue := thisValue.
	self do: [ :each | nextValue := binaryBlock value: nextValue value: each ].
	^ nextValue
]

{ #category : #testing }
DoublyLinkedList >> isEmpty [
	^ firstNode isNil
]

{ #category : #testing }
DoublyLinkedList >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
DoublyLinkedList >> isNotEmpty [
	^ firstNode isNotNil
]

{ #category : #enumerating }
DoublyLinkedList >> noneSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for all elements return true.
	Otherwise return false"

	self do: [ :item | (aBlock value: item) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #testing }
DoublyLinkedList >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #testing }
DoublyLinkedList >> occurrencesOf: anObject [
	"Answer how many of the receiver's elements are equal to anObject."

	| count |
	count := 0.
	self do: [ :each | anObject = each ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #printing }
DoublyLinkedList >> printElementsOn: aStream [
	aStream nextPut: $(.
	self
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #printing }
DoublyLinkedList >> printNameOn: aStream [
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name
]

{ #category : #printing }
DoublyLinkedList >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	self printNameOn: aStream.
	self printElementsOn: aStream
]

{ #category : #printing }
DoublyLinkedList >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self do: [ :elem | aStream print: elem ] separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
DoublyLinkedList >> printOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'"

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == lastNode
				ifTrue: [ aStream nextPutAll: lastDelimString ]
				ifFalse: [ 
					current == firstNode
						ifFalse: [ aStream nextPutAll: delimString ] ].
			aStream print: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
DoublyLinkedList >> reject: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver only those elements for 
	which aBlock evaluates to false. Answer the new collection."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(aBlock value: current value)
				ifFalse: [ newCollection add: current value ].
			current := current nextNode ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> reject: rejectBlock thenCollect: collectBlock [
	"Utility method to improve readability."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(rejectBlock value: current value)
				ifFalse: [ newCollection add: (collectBlock value: current value) ].
			current := current nextNode ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> reject: rejectBlock thenDo: aBlock [
	"Utility method to improve readability."

	self
		do: [ :each | 
			(rejectBlock value: each)
				ifFalse: [ aBlock value: each ] ]
]

{ #category : #enumerating }
DoublyLinkedList >> select: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Collect into a new collection like the receiver, only those elements for 
	which aBlock evaluates to true. Answer the new collection."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(aBlock value: current value)
				ifTrue: [ newCollection add: current value ].
			current := current nextNode ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> select: selectBlock thenCollect: collectBlock [
	"Utility method to improve readability."
	"Optimized."

	| newCollection current |
	newCollection := self class new.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(selectBlock value: current value)
				ifTrue: [ newCollection add: (collectBlock value: current value) ].
			current := current nextNode ].
	^ newCollection
]

{ #category : #enumerating }
DoublyLinkedList >> select: selectBlock thenDo: doBlock [
	"Utility method to improve readability.
	Do not create the intermediate collection."

	self
		do: [ :each | 
			(selectBlock value: each)
				ifTrue: [ doBlock value: each ] ]
]

{ #category : #accessing }
DoublyLinkedList >> size [
	"Answer how many elements the receiver contains."

	^ tally
]

{ #category : #enumerating }
DoublyLinkedList >> sumNumbers: aBlock [
	"This is implemented using a variant of the normal inject:into: pattern
	that is specific to handling numbers. aBlock is expected to return a number
	for every element in the collection.
	
	Different from the sum: implementation, the default value is zero. While sum: is 
	more general, sumNumbers: is meant to support the most often encountered use case of
	dealing with numbers."

	^ self inject: 0 into: [ :sum :each | sum + (aBlock value: each) ]
]
