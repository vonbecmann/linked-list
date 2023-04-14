"
i'm a singly linked list.
a really simple implementation.

"
Class {
	#name : #SinglyLinkedList,
	#superclass : #Object,
	#instVars : [
		'tally',
		'firstNode',
		'lastNode'
	],
	#category : #'LinkedList-Core-Sequenceable'
}

{ #category : #'instance creation' }
SinglyLinkedList class >> with: anObject [
	"Answer an instance of me containing anObject."

	^ self new
		add: anObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedList class >> with: firstObject with: secondObject [
	"Answer an instance of me containing firstObject and secondObject."

	^ self new
		add: firstObject;
		add: secondObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedList class >> with: firstObject with: secondObject with: thirdObject [
	"Answer an instance of me containing the three arguments as elements."

	^ self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedList class >> with: firstObject with: secondObject with: thirdObject with: fourthObject [
	"Answer an instance of me, containing the four arguments as the elements."

	^ self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		add: fourthObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedList class >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject [
	"Answer an instance of me, containing the five arguments as the elements."

	^ self new
		add: firstObject;
		add: secondObject;
		add: thirdObject;
		add: fourthObject;
		add: fifthObject;
		yourself
]

{ #category : #'instance creation' }
SinglyLinkedList class >> withAll: aCollection [
	"Create a new collection containing all the elements from aCollection."

	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
SinglyLinkedList >> = anObject [
	| list1 list2 |
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	list1 := self firstNode.
	list2 := anObject firstNode.
	[ list1 isNil ]
		whileFalse: [
			list1 value = list2 value
				ifFalse: [ ^ false ].
			list1 := list1 nextNode.
			list2 := list2 nextNode ].
	^ true
]

{ #category : #adding }
SinglyLinkedList >> add: anObject [
	^ self addLast: anObject
]

{ #category : #adding }
SinglyLinkedList >> addAll: aCollection [
	"Include all the elements of aCollection as the receiver's elements. Answer
	aCollection. Actually, any object responding to #do: can be used as argument."

	aCollection do: [:each | self add: each].
	^ aCollection
]

{ #category : #adding }
SinglyLinkedList >> addFirst: anObject [
	"Add a node to the beginning of the receiver's list."

	| node |
	node := SinglyLinkedNode with: anObject next: firstNode.
	firstNode ifNil: [ lastNode := node ].
	firstNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #adding }
SinglyLinkedList >> addLast: anObject [
	"Add a node to the end of the receiver's list."

	| node |
	node := SinglyLinkedNode with: anObject.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #enumerating }
SinglyLinkedList >> allSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self
		do: [ :each |
			(aBlock value: each) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
SinglyLinkedList >> anyOne [
	^ self first
]

{ #category : #enumerating }
SinglyLinkedList >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self
		do: [ :each |
			(aBlock value: each)
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #converting }
SinglyLinkedList >> asArray [
	"Optimized for efficiency"

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self do: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #enumerating }
SinglyLinkedList >> collect: aBlock [
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
SinglyLinkedList >> collect: collectBlock thenDo: doBlock [
	"Utility method to improve readability."

	self do: [ :each | doBlock value: (collectBlock value: each) ]
]

{ #category : #enumerating }
SinglyLinkedList >> collect: collectBlock thenSelect: selectBlock [
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
SinglyLinkedList >> detect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the first element for which aBlock evaluates to true."

	^ self detect: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #enumerating }
SinglyLinkedList >> detect: aBlock ifFound: foundBlock [
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
SinglyLinkedList >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
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
SinglyLinkedList >> detect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.
	Answer the first element for which aBlock evaluates to true. If none
	evaluate to true, then evaluate the argument, exceptionBlock."

	^ self detect: aBlock ifFound: [ :element | element ] ifNone: exceptionBlock
]

{ #category : #enumerating }
SinglyLinkedList >> do: aBlock [
	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [
			aBlock value: current value.
			current := current nextNode ]
]

{ #category : #enumerating }
SinglyLinkedList >> do: elementBlock separatedBy: separatorBlock [
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
SinglyLinkedList >> do: aBlock without: anItem [
	"Enumerate all elements in the receiver.
	Execute aBlock for those elements that are not equal to the given item"

	^ self do: [ :each | anItem = each ifFalse: [ aBlock value: each ] ]
]

{ #category : #private }
SinglyLinkedList >> emptyCheck [

	self ifEmpty: [ self emptyError ]
]

{ #category : #private }
SinglyLinkedList >> emptyError [
	^ Error signal: 'collection is empty!'
]

{ #category : #private }
SinglyLinkedList >> errorNotFound: anObject [
	Error
		signal:
			(String
				streamContents: [ :stream |
					stream print: anObject.
					stream << ' not found in '.
					stream print: self class ])
]

{ #category : #accessing }
SinglyLinkedList >> first [
	"Answer the first element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode ifNil: [ self emptyError ] ifNotNil: [ firstNode value ]
]

{ #category : #private }
SinglyLinkedList >> firstNode [
	^ firstNode
]

{ #category : #comparing }
SinglyLinkedList >> hash [
	| hash |
	hash := self class hash.
	self do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash
]

{ #category : #testing }
SinglyLinkedList >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
SinglyLinkedList >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedList >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedList >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
SinglyLinkedList >> includes: anObject [
	"Answer whether anObject is one of the receiver's elements."

	^ self anySatisfy: [ :each | each = anObject ]
]

{ #category : #testing }
SinglyLinkedList >> includesAll: aCollection [
	"Answer whether all the elements of aCollection are in the receiver."

	^ aCollection allSatisfy: [ :each | self includes: each ]
]

{ #category : #initialization }
SinglyLinkedList >> initialize [
	super initialize.
	tally := 0
]

{ #category : #enumerating }
SinglyLinkedList >> inject: thisValue into: binaryBlock [
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
SinglyLinkedList >> isEmpty [
	^ firstNode isNil
]

{ #category : #testing }
SinglyLinkedList >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
SinglyLinkedList >> isNotEmpty [
	^ firstNode isNotNil
]

{ #category : #accessing }
SinglyLinkedList >> last [
	"Answer the last element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ lastNode ifNil: [ self emptyError ] ifNotNil: [ lastNode value ]
]

{ #category : #enumerating }
SinglyLinkedList >> noneSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for all elements return true.
	Otherwise return false"

	self do: [ :item | (aBlock value: item) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #testing }
SinglyLinkedList >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #testing }
SinglyLinkedList >> occurrencesOf: anObject [
	"Answer how many of the receiver's elements are equal to anObject."

	| count |
	count := 0.
	self
		do: [ :each |
			anObject = each ifTrue: [ count := count + 1 ] ].
	^ count
]

{ #category : #copying }
SinglyLinkedList >> postCopy [
	| node |
	super postCopy.
	firstNode
		ifNotNil: [
			node := firstNode := firstNode copy.
			[ node nextNode isNil ] whileFalse: [ node nextNode: (node := node nextNode copy) ].
			lastNode := node ]
]

{ #category : #printing }
SinglyLinkedList >> printElementsOn: aStream [
	aStream nextPut: $(.
	self
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #printing }
SinglyLinkedList >> printNameOn: aStream [
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name
]

{ #category : #printing }
SinglyLinkedList >> printOn: aStream [
	"Append a sequence of characters that identify the receiver to aStream."

	self printNameOn: aStream.
	self printElementsOn: aStream
]

{ #category : #printing }
SinglyLinkedList >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self do: [ :elem | aStream print: elem ] separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
SinglyLinkedList >> printOn: aStream delimiter: delimString last: lastDelimString [

	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'"

	| current |
	current := firstNode.
	[ current isNil ] whileFalse: [
		current == lastNode
			ifTrue: [ aStream nextPutAll: lastDelimString ]
			ifFalse: [
			current == firstNode ifFalse: [ aStream nextPutAll: delimString ] ].
		aStream print: current value.
		current := current nextNode ]
]

{ #category : #enumerating }
SinglyLinkedList >> reject: aBlock [
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
SinglyLinkedList >> reject: rejectBlock thenCollect: collectBlock [
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
SinglyLinkedList >> reject: rejectBlock thenDo: aBlock [
	"Utility method to improve readability."

	self
		do: [ :each |
			(rejectBlock value: each)
				ifFalse: [ aBlock value: each ] ]
]

{ #category : #removing }
SinglyLinkedList >> removeAll [
	"Implementation note: this has to be fast"

	firstNode := lastNode := nil.
	tally := 0
]

{ #category : #removing }
SinglyLinkedList >> removeFirst [
	"Remove the first element and answer it. If the receiver is empty, create
	an error notification."

	| firstElement oldNode |
	firstElement := self first.
	oldNode := firstNode.
	firstNode := firstNode == lastNode
		ifTrue: [ lastNode := nil ]
		ifFalse: [ firstNode nextNode ].
	oldNode release.
	tally := tally - 1.
	^ firstElement
]

{ #category : #removing }
SinglyLinkedList >> removeLast [
	"Remove the receiver's last element and answer it. If the receiver is
	empty, create an error notification."

	| lastElement oldNode current |
	lastElement := self last.
	oldNode := lastNode.
	lastNode := firstNode == lastNode
		ifTrue: [ firstNode := nil ]
		ifFalse: [ current := firstNode.
			[ current nextNode == lastNode ] whileFalse: [ current := current nextNode ].
			current
				nextNode: nil;
				yourself ].
	oldNode release.
	tally := tally - 1.
	^ lastElement
]

{ #category : #converting }
SinglyLinkedList >> reversed [
	^ self
		inject: self class new
		into: [ :reversed :each |
			reversed
				addFirst: each;
				yourself ]
]

{ #category : #accessing }
SinglyLinkedList >> second [
	"Answer the second element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode
		ifNil: [ self emptyError ]
		ifNotNil: [ firstNode nextNode ifNil: [ self emptyError ] ifNotNil: [ firstNode nextNode value ] ]
]

{ #category : #enumerating }
SinglyLinkedList >> select: aBlock [
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
SinglyLinkedList >> select: selectBlock thenCollect: collectBlock [
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
SinglyLinkedList >> select: selectBlock thenDo: doBlock [
	"Utility method to improve readability.
	Do not create the intermediate collection."

	self
		do: [ :each |
			(selectBlock value: each)
				ifTrue: [ doBlock value: each ] ]
]

{ #category : #accessing }
SinglyLinkedList >> size [
	"Answer how many elements the receiver contains."

	^ tally
]

{ #category : #'math functions' }
SinglyLinkedList >> sum [
	"This is implemented using a variant of the normal inject:into: pattern.
	The reason for this is that it is not known whether we're in the normal
	number line, i.e. whether 0 is a good initial value for the sum.
	Consider a collection of measurement objects, 0 would be the unitless
	value and would not be appropriate to add with the unit-ed objects."
	| sum sample |

	self emptyCheck.
	sample := self anyOne.
	sum := self inject: sample into: [:accum :each | accum + each].
	^ sum - sample
]

{ #category : #'math functions' }
SinglyLinkedList >> sumNumbers: aBlock [
	"This is implemented using a variant of the normal inject:into: pattern
	that is specific to handling numbers. aBlock is expected to return a number
	for every element in the collection.

	Different from the sum: implementation, the default value is zero. While sum: is
	more general, sumNumbers: is meant to support the most often encountered use case of
	dealing with numbers."

	^ self inject: 0 into: [ :sum :each | sum + (aBlock value: each) ]
]
