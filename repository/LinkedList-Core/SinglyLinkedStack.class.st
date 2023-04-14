"
I implement a singly linked Stack. 
#push: adds a new object of any kind on top of the stack. 
#pop returns the first element and remove it from the stack. 
#top answer the first element of the stack without removing it.
"
Class {
	#name : #SinglyLinkedStack,
	#superclass : #Object,
	#instVars : [
		'tally',
		'firstNode'
	],
	#category : #'LinkedList-Core-Sequenceable'
}

{ #category : #'instance creation' }
SinglyLinkedStack class >> with: anObject [
	"Answer an instance of me containing anObject."

	^ self new
		push: anObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedStack class >> withAll: aCollection [
	"Create a new stack containing all the elements from aCollection."

	^ self new
		pushAll: aCollection;
		yourself
]

{ #category : #converting }
SinglyLinkedStack >> asArray [
	"Optimized for efficiency"

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self do: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #enumerating }
SinglyLinkedStack >> do: aBlock [
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [
			aBlock value: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
SinglyLinkedStack >> do: elementBlock separatedBy: separatorBlock [
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

{ #category : #testing }
SinglyLinkedStack >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
SinglyLinkedStack >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedStack >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedStack >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #initialization }
SinglyLinkedStack >> initialize [
	super initialize.
	tally := 0
]

{ #category : #testing }
SinglyLinkedStack >> isEmpty [
	^ firstNode isNil
]

{ #category : #testing }
SinglyLinkedStack >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
SinglyLinkedStack >> isNotEmpty [
	^ firstNode isNotNil
]

{ #category : #testing }
SinglyLinkedStack >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #removing }
SinglyLinkedStack >> pop [
	"Returns the first element and remove it from the stack."

	| firstElement |
	firstElement := self top.
	firstNode := firstNode nextNode.
	tally := tally - 1.
	^ firstElement
]

{ #category : #copying }
SinglyLinkedStack >> postCopy [
	| node |
	super postCopy.
	firstNode
		ifNotNil: [
			node := firstNode := firstNode copy.
			[ node nextNode isNil ] whileFalse: [ node nextNode: (node := node nextNode copy) ] ]
]

{ #category : #printing }
SinglyLinkedStack >> printElementsOn: aStream [
	aStream nextPut: $(.
	self do: [ :element | aStream print: element ] separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #printing }
SinglyLinkedStack >> printNameOn: aStream [
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name
]

{ #category : #printing }
SinglyLinkedStack >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	self printNameOn: aStream.
	self printElementsOn: aStream
]

{ #category : #printing }
SinglyLinkedStack >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self do: [ :elem | aStream print: elem ] separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
SinglyLinkedStack >> printOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'

	Note: Feel free to improve the code to detect the last element."

	| n sz |
	n := 1.
	sz := self size.
	self
		do: [ :elem |
			n := n + 1.
			aStream print: elem ]
		separatedBy: [
			n = sz
				ifTrue: [ aStream nextPutAll: lastDelimString ]
				ifFalse: [ aStream nextPutAll: delimString ] ]
]

{ #category : #adding }
SinglyLinkedStack >> push: anObject [
	"Adds a new object of any kind on top of the stack."

	firstNode := SinglyLinkedNode with: anObject next: firstNode.
	tally := tally + 1.
	^ anObject
]

{ #category : #adding }
SinglyLinkedStack >> pushAll: aCollection [
	"Include all the elements of aCollection as the receiver's elements. Answer
	aCollection. Actually, any object responding to #do: can be used as argument."

	aCollection do: [ :each | self push: each ].
	^ aCollection
]

{ #category : #removing }
SinglyLinkedStack >> removeAll [
	"Implementation note: this has to be fast"

	firstNode := nil.
	tally := 0
]

{ #category : #accessing }
SinglyLinkedStack >> size [
	"Answer how many elements the receiver contains."

	^ tally
]

{ #category : #accessing }
SinglyLinkedStack >> top [
	"Answer the first element of the stack without removing it."

	^ firstNode
			ifNil: [ Error signal: 'collection is empty!' ]
			ifNotNil: [ firstNode value ]
]
