"
I implement a singly linked queue. 
#nextPut: adds a new object of any kind at the end of the queue. 
#next returns the first element and remove it from the queue. 
#peek answer the first element of the queue without removing it.
"
Class {
	#name : #SinglyLinkedQueue,
	#superclass : #Object,
	#instVars : [
		'firstNode',
		'lastNode',
		'tally'
	],
	#category : #'LinkedList-Core'
}

{ #category : #'instance creation' }
SinglyLinkedQueue class >> with: anObject [
	"Answer an instance of me containing anObject."

	^ self new
		nextPut: anObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedQueue class >> withAll: aCollection [
	"Create a new queue containing all the elements from aCollection."

	^ self new
		nextPutAll: aCollection;
		yourself
]

{ #category : #converting }
SinglyLinkedQueue >> asArray [
	"Optimized for efficiency"

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self do: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #enumerating }
SinglyLinkedQueue >> do: aBlock [
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
SinglyLinkedQueue >> do: elementBlock separatedBy: separatorBlock [
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

{ #category : #private }
SinglyLinkedQueue >> emptyError [
	^ Error signal: 'collection is empty!'
]

{ #category : #accessing }
SinglyLinkedQueue >> head [
	"Answer the head of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode ifNil: [ self emptyError ] ifNotNil: [ firstNode value ]
]

{ #category : #testing }
SinglyLinkedQueue >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
SinglyLinkedQueue >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedQueue >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedQueue >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #initialization }
SinglyLinkedQueue >> initialize [
	super initialize.
	firstNode := lastNode := nil.
	tally := 0
]

{ #category : #testing }
SinglyLinkedQueue >> isEmpty [
	^ firstNode isNil
]

{ #category : #testing }
SinglyLinkedQueue >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
SinglyLinkedQueue >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
SinglyLinkedQueue >> next [
	"Answer the next object accessible by the receiver."

	^ firstNode
		ifNil: [ nil ]
		ifNotNil: [ | head oldNode |
			head := firstNode value.
			oldNode := firstNode.
			firstNode := firstNode == lastNode
				ifTrue: [ lastNode := nil ]
				ifFalse: [ oldNode nextNode ].
			oldNode nextNode: nil.
			tally := tally - 1.
			head ]
]

{ #category : #accessing }
SinglyLinkedQueue >> nextPut: anObject [
	"Insert the argument, anObject, as the next object accessible by the 
	receiver. Answer anObject."

	| node |
	node := SinglyLinkedNode with: anObject.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #accessing }
SinglyLinkedQueue >> nextPutAll: aCollection [
	"Append the elements of aCollection to the sequence of objects accessible 
	by the receiver. Answer aCollection."

	aCollection do: [ :each | self nextPut: each ].
	^ aCollection
]

{ #category : #testing }
SinglyLinkedQueue >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #accessing }
SinglyLinkedQueue >> peek [
	^ firstNode ifNil: [ nil ] ifNotNil: [ firstNode value ]
]

{ #category : #copying }
SinglyLinkedQueue >> postCopy [
	| node |
	super postCopy.
	firstNode
		ifNotNil: [ 
			node := firstNode := firstNode copy.
			[ node nextNode isNil ] whileFalse: [ node nextNode: (node := node nextNode copy) ].
			lastNode := node ]
]

{ #category : #printing }
SinglyLinkedQueue >> printElementsOn: aStream [
	aStream nextPut: $(.
	self
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #printing }
SinglyLinkedQueue >> printNameOn: aStream [
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name
]

{ #category : #printing }
SinglyLinkedQueue >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	self printNameOn: aStream.
	self printElementsOn: aStream
]

{ #category : #printing }
SinglyLinkedQueue >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self do: [ :elem | aStream print: elem ] separatedBy: [ aStream print: delimString ]
]

{ #category : #printing }
SinglyLinkedQueue >> printOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'"

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == lastNode
				ifTrue: [ aStream print: lastDelimString ]
				ifFalse: [ 
					current == firstNode
						ifFalse: [ aStream print: delimString ] ].
			aStream print: current value.
			current := current nextNode ]
]

{ #category : #removing }
SinglyLinkedQueue >> removeAll [
	firstNode := lastNode := nil.
	tally := 0
]

{ #category : #removing }
SinglyLinkedQueue >> removeHead [
	"Remove the head and answer it. If the receiver is empty, create 
	an error notification."

	^ firstNode
		ifNil: [ self emptyError ]
		ifNotNil: [ | head oldNode |
			head := firstNode value.
			oldNode := firstNode.
			firstNode := firstNode == lastNode
				ifTrue: [ lastNode := nil ]
				ifFalse: [ oldNode nextNode ].
			oldNode nextNode: nil.
			tally := tally - 1.
			head ]
]

{ #category : #accessing }
SinglyLinkedQueue >> size [
	"Answer how many elements the receiver contains."

	^ tally
]
