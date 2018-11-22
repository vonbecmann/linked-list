"
association list.

"
Class {
	#name : #AssociationList,
	#superclass : #Object,
	#instVars : [
		'tally',
		'firstNode',
		'lastNode'
	],
	#category : #'LinkedList-Core'
}

{ #category : #adding }
AssociationList >> add: anAssociation [
	self
		associationsDo: [ :assoc | 
			assoc key = anAssociation key
				ifTrue: [ 
					assoc value: anAssociation value.
					^ anAssociation ] ].
	self addLast: anAssociation.
	^ anAssociation
]

{ #category : #adding }
AssociationList >> addAll: aKeyedCollection [
	aKeyedCollection == self
		ifFalse: [ 
			aKeyedCollection 
				keysAndValuesDo: [ :key :value | self at: key put: value ] ].
	^ aKeyedCollection
]

{ #category : #private }
AssociationList >> addLast: anObject [
	"Add a node to the end of the receiver's list."

	| node |
	node := SinglyLinkedNode with: anObject.
	firstNode ifNil: [ firstNode := node ] ifNotNil: [ lastNode nextNode: node ].
	lastNode := node.
	tally := tally + 1.
	^ anObject
]

{ #category : #enumerating }
AssociationList >> allSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self do: [ :each | (aBlock value: each) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
AssociationList >> anyOne [
	"Answer a representative sample of the receiver. This method can
	be helpful when needing to preinfer the nature of the contents of 
	semi-homogeneous collections."

	^ self first value
]

{ #category : #enumerating }
AssociationList >> anySatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

  	self do: [ :each | (aBlock value: each) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
AssociationList >> associationAt: key [
	"Returns the association for the given key."

	^ self associationAt: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : #accessing }
AssociationList >> associationAt: key ifAbsent: aBlock [
	self
		associationsDo: [ :assoc | 
			assoc key = key
				ifTrue: [ ^ assoc ] ].
	^ aBlock value
]

{ #category : #enumerating }
AssociationList >> associationsDo: aBlock [
	"Evaluate aBlock with each association"

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextNode ]
]

{ #category : #accessing }
AssociationList >> at: key [
	"Answer the value associated with the key."

	^ self at: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : #accessing }
AssociationList >> at: key ifAbsent: aBlock [
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ | assoc |
			assoc := current value.
			assoc key = key
				ifTrue: [ ^ assoc value ].
			current := current nextNode ].
	^ aBlock value
]

{ #category : #accessing }
AssociationList >> at: key put: anObject [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	self
		associationsDo: [ :assoc | 
			assoc key = key
				ifTrue: [ 
					assoc value: anObject.
					^ anObject ] ].
	self addLast: (Association basicNew key: key value: anObject).
	^ anObject
]

{ #category : #enumerating }
AssociationList >> collect: aBlock [
	"Evaluate aBlock with each of my values as the argument.  Collect the
	resulting values into a collection that is like me. Answer with the new
	collection."

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			newCollection
				addLast: (Association basicNew key: assoc key value: (aBlock value: assoc value)) ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> collect: collectBlock thenDo: doBlock [
	"Utility method to improve readability."

	self do: [ :each | doBlock value: (collectBlock value: each) ]
]

{ #category : #enumerating }
AssociationList >> collect: collectBlock thenSelect: selectBlock [
	"Utility method to improve readability."

	^ (self collect: collectBlock) select: selectBlock
]

{ #category : #adding }
AssociationList >> declare: key from: aDictionary [
	"Add key to the receiver. If key already exists, do nothing. If aDictionary 
	includes key, then remove it from aDictionary and use its association as 
	the element of the receiver."

	(self includesKey: key)
		ifTrue: [ ^ self ].
	(aDictionary includesKey: key)
		ifTrue: [ 
			self add: (aDictionary associationAt: key).
			aDictionary removeKey: key ]
		ifFalse: [ self add: key -> nil ]
]

{ #category : #enumerating }
AssociationList >> detect: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the first element for which aBlock evaluates to true."

	^ self detect: aBlock ifNone: [ self errorNotFound: aBlock ]
]

{ #category : #enumerating }
AssociationList >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [ 
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
AssociationList >> detect: aBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the first element for which aBlock evaluates to true. If none  
	evaluate to true, then evaluate the argument, exceptionBlock."

	^ self detect: aBlock ifFound: [ :element | element ] ifNone: exceptionBlock
]

{ #category : #enumerating }
AssociationList >> do: aBlock [
	"Evaluate aBlock with each association's value"

	self associationsDo: [ :assoc | aBlock value: assoc value ]
]

{ #category : #enumerating }
AssociationList >> do: elementBlock separatedBy: separatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between."

	"Optimized."

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == firstNode ifFalse: [ separatorBlock value ].
			elementBlock value: current value value.
			current := current nextNode ]
]

{ #category : #enumerating }
AssociationList >> do: aBlock without: anItem [
	"Enumerate all elements in the receiver. 
	Execute aBlock for those elements that are not equal to the given item"

	self do: [ :each | anItem = each ifFalse: [ aBlock value: each ] ]
]

{ #category : #private }
AssociationList >> emptyError [
	^ Error signal: 'collection is empty!'
]

{ #category : #private }
AssociationList >> errorKeyNotFound: aKey [
	Error
		signal:
			(String
				streamContents: [ :stream | 
					stream << 'key '.
					stream print: aKey.
					stream << ' not found in '.
					stream print: self class ])
]

{ #category : #private }
AssociationList >> first [
	"Answer the first association of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode ifNil: [ self emptyError ] ifNotNil: [ firstNode value ]
]

{ #category : #testing }
AssociationList >> identityIncludes: anObject [
	"Answer whether anObject is one of the receiver's elements."

	self do: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
AssociationList >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
AssociationList >> ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise"

	" If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
AssociationList >> ifNotEmpty: aBlock [
	"Evaluate the given block with the receiver as argument, answering its value
    unless the receiver is empty, in which case answer the receiver."

	^ self isEmpty
		ifTrue: [ self ]
		ifFalse: [ aBlock cull: self ]
]

{ #category : #testing }
AssociationList >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : #testing }
AssociationList >> includes: anObject [
	self do: [ :each | anObject = each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
AssociationList >> includesAll: aCollection [
	"Answer whether all the elements of aCollection are in the receiver."

	aCollection do: [ :elem | (self includes: elem) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #testing }
AssociationList >> includesAny: aCollection [
	"Answer whether any element of aCollection is one of the receiver's elements."

	aCollection 	do: [ :elem | (self includes: elem) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
AssociationList >> includesKey: key [
	"Answer whether the receiver has a key equal to the argument, key."

	self associationsDo: [ :assoc | assoc key = key ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #initialization }
AssociationList >> initialize [
	firstNode := lastNode := nil.
	tally := 0
]

{ #category : #enumerating }
AssociationList >> inject: thisValue into: binaryBlock [
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
AssociationList >> isEmpty [
	^ firstNode isNil
]

{ #category : #testing }
AssociationList >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^ self isEmpty
]

{ #category : #testing }
AssociationList >> isNotEmpty [
	^ self isEmpty not
]

{ #category : #accessing }
AssociationList >> keys [
	"Answer an Array containing the receiver's keys."

	| keys index |
	keys := Array new: self size.
	index := 0.
	self associationsDo: [ :assoc | keys at: (index := index + 1) put: assoc key ].
	^ keys
]

{ #category : #enumerating }
AssociationList >> keysAndValuesDo: aBlock [
	self associationsDo: [ :assoc | aBlock value: assoc key value: assoc value ]
]

{ #category : #enumerating }
AssociationList >> noneSatisfy: aBlock [
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for all elements return true.
	Otherwise return false"

	self do: [ :each | (aBlock value: each) ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #testing }
AssociationList >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isNotEmpty
]

{ #category : #testing }
AssociationList >> occurrencesOf: anObject [
	"Answer how many of the receiver's elements are equal to anObject."

	| ocurrences |
	ocurrences := 0.
	self do: [ :each | anObject = each ifTrue: [ ocurrences := ocurrences + 1 ] ].
	^ ocurrences
]

{ #category : #private }
AssociationList >> previousNodeAt: key ifAbsent: aBlock [
	| previous current |
	previous := nil.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current value key = key
				ifTrue: [ ^ previous ].
			previous := current.
			current := current nextNode ].
	^ aBlock value
]

{ #category : #enumerating }
AssociationList >> reject: aBlock [
	"Evaluate aBlock with each of my values as the argument. Collect into a collection 
	that is like me, only those associations for which aBlock evaluates to false."

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :each | 
			(aBlock value: each value)
				ifFalse: [ newCollection addLast: each copy ] ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> reject: rejectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	^ (self reject: rejectBlock) collect: collectBlock
]

{ #category : #enumerating }
AssociationList >> reject: rejectBlock thenDo: doBlock [
	"Utility method to improve readability."

	(self reject: rejectBlock) do: doBlock
]

{ #category : #'initialize-release' }
AssociationList >> release [
	firstNode := lastNode := nil.
	tally := 0.
	super release
]

{ #category : #removing }
AssociationList >> removeKey: key [
	"Remove key from the receiver.
	If key is not in the receiver, notify an error."

	^ self removeKey: key ifAbsent: [ self errorKeyNotFound: key ]
]

{ #category : #removing }
AssociationList >> removeKey: key ifAbsent: aBlock [
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."

	"if previous isNil then remove firstNode otherwise remove previous nextNode."

	| previous assoc oldNode |
	previous := self previousNodeAt: key ifAbsent: [ ^ aBlock value ].
	previous isNil
		ifTrue: [ 
			assoc := firstNode value.
			oldNode := firstNode.
			firstNode := firstNode == lastNode
				ifTrue: [ lastNode := nil ]
				ifFalse: [ firstNode nextNode ] ]
		ifFalse: [ 
			assoc := previous nextNode value.
			oldNode := previous nextNode.
			previous nextNode == lastNode
				ifTrue: [ lastNode := previous ].
			previous nextNode: previous nextNode nextNode ].
	oldNode release.
	tally := tally - 1.
	^ assoc value
]

{ #category : #enumerating }
AssociationList >> select: aBlock [
	"Evaluate aBlock with each of my values as the argument. Collect into a collection 
	that is like me, only those associations for which aBlock evaluates to true."

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :each | 
			(aBlock value: each value)
				ifTrue: [ newCollection addLast: each copy ] ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> select: selectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	^ (self select: selectBlock) collect: collectBlock
]

{ #category : #enumerating }
AssociationList >> select: selectBlock thenDo: doBlock [
	"Utility method to improve readability.
	Do not create the intermediate collection."

	self
		do: [ :each | 
			(selectBlock value: each)
				ifTrue: [ doBlock value: each ] ]
]

{ #category : #accessing }
AssociationList >> size [
	"Answer how many elements the receiver contains."

	^ tally
]

{ #category : #'math functions' }
AssociationList >> sumNumbers: aBlock [
	"This is implemented using a variant of the normal inject:into: pattern
	that is specific to handling numbers. aBlock is expected to return a number
	for every element in the collection.
	
	Different from the sum: implementation, the default value is zero. While sum: is 
	more general, sumNumbers: is meant to support the most often encountered use case of
	dealing with numbers."

	^ self inject: 0 into: [ :sum :each | sum + (aBlock value: each) ]
]