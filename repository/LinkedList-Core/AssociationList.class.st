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

{ #category : #'instance creation' }
AssociationList class >> empty [
	^ self new
]

{ #category : #'instance creation' }
AssociationList class >> with: anAssociation [
	"Answer an instance of me containing anAssociation."

	^ self empty
		add: anAssociation;
		yourself
]

{ #category : #'instance creation' }
AssociationList class >> with: firstAssoc with: secondAssoc [
	"Answer an instance of me containing the two arguments as elements."

	^ self new
		add: firstAssoc;
		add: secondAssoc;
		yourself
]

{ #category : #copying }
AssociationList >> , aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
AssociationList >> = associationList [
	self == associationList ifTrue: [ ^ true ].
	self class = associationList class ifFalse: [ ^ false ].
	self size = associationList size ifFalse: [ ^ false ].
	self
		associationsDo: [ :assoc | 
			(associationList at: assoc key ifAbsent: [ ^ false ]) = assoc value
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #adding }
AssociationList >> add: anAssociation [
	self
		associationsDo: [ :assoc | 
			(self is: assoc key equalTo: anAssociation key)
				ifTrue: [ 
					assoc value: anAssociation value.
					^ anAssociation ] ].
	^ self addLast: anAssociation
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

{ #category : #converting }
AssociationList >> asArray [
	"Answer an Array whose elements are the elements of the receiver."

	"Optimized for efficiency"

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self do: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
]

{ #category : #converting }
AssociationList >> asBag [
	"Answer a Bag whose elements are the elements of the receiver."

	^ Bag withAll: self
]

{ #category : #converting }
AssociationList >> asByteArray [
	"Answer a ByteArray whose elements are the elements of the receiver.
	Implementation note: Cannot use ''ByteArray withAll: self'' as that only
	works for SequenceableCollections which support the replacement 
	primitive."

	| array index |
	array := ByteArray new: self size.
	index := 0.
	self do: [ :each | array at: (index := index + 1) put: each ].
	^ array
]

{ #category : #printing }
AssociationList >> asCommaString [
	"Return collection printed as 'a, b, c' "

	^ String streamContents: [ :s | self asStringOn: s delimiter: ', ' ]
]

{ #category : #printing }
AssociationList >> asCommaStringAnd [
	"Return collection printed as 'a, b and c' "

	^ String streamContents: [ :s | self asStringOn: s delimiter: ', ' last: ' and ' ]
]

{ #category : #converting }
AssociationList >> asIdentitySet [
	"Answer a IdentitySet whose elements are the elements of the receiver."

	^ IdentitySet withAll: self
]

{ #category : #converting }
AssociationList >> asOrderedCollection [
	"Answer an OrderedCollection whose elements are the elements of the receiver."

	^ OrderedCollection withAll: self
]

{ #category : #converting }
AssociationList >> asSet [
	"Answer a Set whose elements are the elements of the receiver."

	^ Set withAll: self
]

{ #category : #converting }
AssociationList >> asSortedCollection [
	"Answer a SortedCollection whose elements are the elements of the receiver. The sort order is the default less than or equal. Note that you should use #sorted: if you don't really need a SortedCollection, but a sorted collection."

	^ SortedCollection withAll: self
]

{ #category : #converting }
AssociationList >> asSortedCollection: aSortBlock [
	"Answer a SortedCollection whose elements are the elements of the receiver. The sort order is defined by the argument, aSortBlock. Note that this is better to use #sorted: if you don't really need a SortedCollection, but a sorted collection!!"

	^ (SortedCollection new: self size)
		sortBlock: aSortBlock;
		addAll: self;
		yourself
]

{ #category : #printing }
AssociationList >> asStringOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c'
	Uses #asString instead of #print:."

	self
		do: [ :elem | aStream nextPutAll: elem asString ]
		separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
AssociationList >> asStringOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'.
	Uses #asString instead of #print: ."

	self
		do: [ :elem | aStream nextPutAll: elem asString ]
		separatedBy: [ aStream nextPutAll: delimString ]
		lastSeparatedBy: [ aStream nextPutAll: lastDelimString ]
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
			(self is: assoc key equalTo: key)
				ifTrue: [ ^ assoc ] ].
	^ aBlock value
]

{ #category : #accessing }
AssociationList >> associations [
	"Answer a Collection containing the receiver's associations."

	"Optimized for efficiency"

	| newArray index |
	newArray := Array new: self size.
	index := 0.
	self associationsDo: [ :each | newArray at: (index := index + 1) put: each ].
	^ newArray
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

{ #category : #enumerating }
AssociationList >> associationsSelect: aBlock [
	"Evaluate aBlock with each of my associations as the argument. Collect
	into a collection that is like me, only those associations for which aBlock evaluates
	to true."

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			(aBlock value: assoc)
				ifTrue: [ newCollection addLast: assoc copy ] ].
	^ newCollection
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

	self
		associationsDo: [ :assoc | 
			(self is: assoc key equalTo: key)
				ifTrue: [ ^ assoc value ] ].
	^ aBlock value
]

{ #category : #accessing }
AssociationList >> at: key put: anObject [
	"Set the value at key to be anObject.  If key is not found, create a
	new entry for key and set is value to anObject. Answer anObject."

	self
		associationsDo: [ :assoc | 
			(self is: key equalTo: assoc key)
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
	"Optimized"

	| newCollection newElement |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			newElement := collectBlock value: assoc value.
			(selectBlock value: newElement)
				ifTrue: [ newCollection addLast: (Association basicNew key: assoc key value: newElement) ] ].
	^ newCollection
]

{ #category : #copying }
AssociationList >> copyWith: newElement [
	" Answer a new collection with newElement added "

	^ self copy
		add: newElement;
		yourself
]

{ #category : #copying }
AssociationList >> copyWithoutAll: aCollection [
	"Answer a copy of the receiver that does not contain any elements 
	equal to those in aCollection."

	^ self reject: [ :each | aCollection includes: each ]
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
AssociationList >> detect: aBlock ifFound: foundBlock [
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
AssociationList >> difference: aCollection [
	"Answer the set theoretic difference of two collections. This is a specialized version for Dictionaries keeping the keys of the objects. At a slightly higher price of an additional Set to track duplicates."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) not and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]
]

{ #category : #enumerating }
AssociationList >> do: aBlock [
	"Evaluate aBlock with each association's value"

	"Optimized."

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value value.
			current := current nextNode ]
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
AssociationList >> do: elementBlock separatedBy: separatorBlock lastSeparatedBy: lastSeparatorBlock [
	"Evaluate the elementBlock for all elements in the receiver,
	and evaluate the separatorBlock between them and evaluate
	the lastSeparatorBlock before the last"

	"Optimized."

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == firstNode
				ifFalse: [ 
					current == lastNode
						ifTrue: [ lastSeparatorBlock value ]
						ifFalse: [ separatorBlock value ] ].
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
AssociationList >> errorNotFound: anObject [
	"Raise a NotFound exception."

	NotFound signalFor: anObject
]

{ #category : #private }
AssociationList >> first [
	"Answer the first association of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode ifNil: [ self emptyError ] ifNotNil: [ firstNode value ]
]

{ #category : #comparing }
AssociationList >> hash [
	| hash |
	hash := self class hash.
	self associationsDo: [ :assoc | hash := (hash + assoc hash) hashMultiply ].
	^ hash
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
AssociationList >> includesAssociation: anAssociation [
	^ (self associationAt: anAssociation key ifAbsent: [ ^ false ]) value = anAssociation value
]

{ #category : #testing }
AssociationList >> includesIdentity: anObject [
	"Answer whether anObject is one of the values of the receiver.  Contrast #includes: in which there is only an equality check, here there is an identity check"

	self do: [ :each | anObject == each ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #testing }
AssociationList >> includesKey: key [
	"Answer whether the receiver has a key equal to the argument, key."

	self
		associationsDo: [ :assoc | 
			(self is: assoc key equalTo: key)
				ifTrue: [ ^ true ] ].
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

{ #category : #enumerating }
AssociationList >> intersection: aCollection [
	"Answer the set theoretic intersection of two collections."

	| other duplicates |
	other := aCollection asSet.
	duplicates := Set new.
	^ self
		select: [ :each | 
			((other includes: each) and: [ (duplicates includes: each) not ])
				ifTrue: [ duplicates add: each. true ]
				ifFalse: [ false ] ]
]

{ #category : #private }
AssociationList >> is: firstKey equalTo: secondKey [
	" is first key equal to second key?"

	^ firstKey = secondKey
]

{ #category : #testing }
AssociationList >> isDictionary [
	^ true
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

{ #category : #removing }
AssociationList >> keysAndValuesRemove: keyValueBlock [
	"Removes all entries for which keyValueBlock returns true."

	"When removing many items, you must not do it while iterating over the dictionary, since it may be changing.  This method takes care of tallying the removals in a first pass, and then performing all the deletions afterward.  Many places in the sytem could be simplified by using this method."

	| removals |
	removals := OrderedCollection new.
	self
		associationsDo: [ :assoc | 
			(keyValueBlock value: assoc key value: assoc value)
				ifTrue: [ removals add: assoc key ] ].
	removals do: [ :aKey | self removeKey: aKey ]
]

{ #category : #enumerating }
AssociationList >> keysDo: aBlock [
	"Evaluate aBlock for each of the receiver's keys."

	self associationsDo: [ :association | aBlock value: association key ]
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

{ #category : #copying }
AssociationList >> postCopy [
	| node |
	super postCopy.
	firstNode
		ifNotNil: [ 
			node := firstNode := firstNode copy.
			[ node nextNode isNil ] whileFalse: [ node nextNode: (node := node nextNode copy) ].
			lastNode := node ]
]

{ #category : #private }
AssociationList >> previousNodeAt: key ifAbsent: aBlock [
	| previous current |
	previous := nil.
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			(self is: current value key equalTo: key)
				ifTrue: [ ^ previous ].
			previous := current.
			current := current nextNode ].
	^ aBlock value
]

{ #category : #printing }
AssociationList >> printElementsOn: aStream [
	"The original code used #skip:, but some streams do not support that,
	 and we don't really need it."

	aStream nextPut: $(.
	self do: [ :element | aStream print: element ] separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #printing }
AssociationList >> printNameOn: aStream [
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name
]

{ #category : #printing }
AssociationList >> printOn: aStream delimiter: delimString [
	"Print elements on a stream separated
	with a delimiter String like: 'a, b, c' "

	self do: [ :elem | aStream print: elem ] separatedBy: [ aStream nextPutAll: delimString ]
]

{ #category : #printing }
AssociationList >> printOn: aStream delimiter: delimString last: lastDelimString [
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'."

	self
		do: [ :elem | aStream print: elem ]
		separatedBy: [ aStream nextPutAll: delimString ]
		lastSeparatedBy: [ aStream nextPutAll: lastDelimString ]
]

{ #category : #enumerating }
AssociationList >> reject: aBlock [
	"Evaluate aBlock with each of my values as the argument. Collect into a collection 
	that is like me, only those associations for which aBlock evaluates to false."

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			(aBlock value: assoc value)
				ifFalse: [ newCollection addLast: assoc copy ] ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> reject: rejectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	"Optimize"

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			(rejectBlock value: assoc value)
				ifFalse: [ 
					newCollection addLast: (Association basicNew key: assoc key value: (collectBlock value: assoc value)) ] ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> reject: rejectBlock thenDo: doBlock [
	"Utility method to improve readability. 
	Do not create the intermediate collection."

	self
		do: [ :each | 
			(rejectBlock value: each)
				ifFalse: [ doBlock value: each ] ]
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
		associationsDo: [ :assoc | 
			(aBlock value: assoc value)
				ifTrue: [ newCollection addLast: assoc copy ] ].
	^ newCollection
]

{ #category : #enumerating }
AssociationList >> select: selectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	"Optimized"

	| newCollection |
	newCollection := self class new.
	self
		associationsDo: [ :assoc | 
			(selectBlock value: assoc value)
				ifTrue: [ 
					newCollection addLast: (Association basicNew key: assoc key value: (collectBlock value: assoc value)) ] ].
	^ newCollection
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

{ #category : #enumerating }
AssociationList >> union: aCollection [
	"Answer the set theoretic union of the receiver and aCollection, using the receiver's notion of equality and not side effecting the receiver at all."

	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #accessing }
AssociationList >> values [
	"Answer a Collection containing the receiver's values."

	"Optimized for efficiency"

	| values index |
	values := Array new: self size.
	index := 0.
	self do: [ :each | values at: (index := index + 1) put: each ].
	^ values
]

{ #category : #enumerating }
AssociationList >> valuesDo: aBlock [
	"Evaluate aBlock for each of the receiver's values."

	self do: aBlock
]
