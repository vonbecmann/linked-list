Class {
	#name : #SinglyLinkedListTest,
	#superclass : #ClassTestCase,
	#traits : 'TIterateTest + TEmptyTest + TSizeTest + (TPrintTest - {#testStoreOn}) + (TAddTest - {#testTAddIfNotPresentWithElementAlreadyIn. #testTAddIfNotPresentWithNewElement. #testTAddWithOccurrences. #testTWrite. #testTWriteTwice}) + (TCreationWithTest - {#testOfSize}) + TCloneTest',
	#classTraits : 'TIterateTest classTrait + TEmptyTest classTrait + TSizeTest classTrait + TPrintTest classTrait + TAddTest classTrait + TCreationWithTest classTrait + TCloneTest classTrait',
	#instVars : [
		'list',
		'otherList'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #coverage }
SinglyLinkedListTest >> classToBeTested [
	^ SinglyLinkedList
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionClass [
	^ self classToBeTested
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionMoreThan5Elements [
	" return a collection including at least 5 elements"

	^ 10 to: 17
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionWithElement [
	"Returns a collection that already includes what is returned by #element."

	^ self empty
		add: self element;
		yourself
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"

	^ list
]

{ #category : #requirements }
SinglyLinkedListTest >> element [
	"Returns an object that can be added to the collection returned by #collection."

	^ 13
]

{ #category : #requirements }
SinglyLinkedListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
SinglyLinkedListTest >> nonEmpty [
	^ list
]

{ #category : #requirements }
SinglyLinkedListTest >> otherCollection [
	"Returns a collection that does not include what is returned by #element."

	^ otherList
]

{ #category : #coverage }
SinglyLinkedListTest >> selectorsToBeIgnored [

	| private | 
	private := #( #initialize #errorNotFound: #emptyError #firstNode #gtInspectorItemsIn: #postCopy).
	^ super selectorsToBeIgnored, private

]

{ #category : #running }
SinglyLinkedListTest >> setUp [
	super setUp.
	list := self empty.
	list
		add: 1.2;
		add: -2;
		add: 7;
		add: true;
		add: false.
	otherList := self empty
		addAll: (7 to: 11);
		yourself
]

{ #category : #requirements }
SinglyLinkedListTest >> sizeCollection [
	"Answers a collection not empty"

	^ list
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureIterateTest [

	| res |
	self collectionWithoutNilElements.
	self
		assert: (self collectionWithoutNilElements occurrencesOf: nil)
		equals: 0.
	res := true.
	self collectionWithoutNilElements
		detect: [ :each | 
		(self collectionWithoutNilElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self deny: res
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testBasicCollect [

	| res index |
	index := 0.
	res := self collectionWithoutNilElements collect: [ :each | 
		       index := index + 1.
		       each ].

	res do: [ :each | 
		self
			assert: (self collectionWithoutNilElements occurrencesOf: each)
			equals: (res occurrencesOf: each) ].
	self assert: index equals: self collectionWithoutNilElements size
]

{ #category : #'tests - copy - clone' }
SinglyLinkedListTest >> testCopyCreatesNewObject [

	| copy |
	copy := self nonEmpty copy.
	self deny: self nonEmpty identicalTo: copy
]

{ #category : #'tests - copy - clone' }
SinglyLinkedListTest >> testCopyNonEmpty [

	| copy |
	copy := self nonEmpty copy.
	self denyEmpty: copy.
	self assert: copy size equals: self nonEmpty size.
	self nonEmpty do: [ :each | copy includes: each ]
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDetect [

	| res element |
	element := self collectionWithoutNilElements anyOne.

	res := self collectionWithoutNilElements detect: [ :each | 
		       each = element ].
	self assert: res equals: element
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenNobodyIsFound [
	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ true ] ifNone: [ false ].
	self deny: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFound [
	| wasFound foundObject |
	foundObject := nil.
	wasFound := self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element | 
			foundObject := element.
			true ]
		ifNone: [ false ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ true ] ifNone: [ false ].
	self assert: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenNobodyIsFound [
	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ wasFound := true ].
	self deny: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenSomethingIsFound [
	| wasFound foundObject |
	wasFound := false.
	foundObject := nil.
	self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element | 
			foundObject := element.
			wasFound := true ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)

]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ wasFound := true ].
	self assert: wasFound
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDetectIfNone [

	| res element |
	res := self collectionWithoutNilElements
		       detect: [ :each | each notNil not ]
		       ifNone: [ 100 ].
	self assert: res equals: 100.

	element := self collectionWithoutNilElements anyOne.
	res := self collectionWithoutNilElements
		       detect: [ :each | each = element ]
		       ifNone: [ 100 ].
	self assert: res equals: element
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectWhenNobodyIsFound [
	self should: [ self collectionWithoutNilElements detect: [ :each | each isNil ] ] raise: Error
]

{ #category : #tests }
SinglyLinkedListTest >> testFirst01 [
	self
		should: [ self empty first ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testFirst02 [
	self assert: self nonEmpty first equals: 1.2
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIfNotEmpty [

	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testInjectInto [

	| result |
	result := self collectionWithoutNilElements
		          inject: 0
		          into: [ :inj :ele | ele notNil ifTrue: [ inj + 1 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #tests }
SinglyLinkedListTest >> testLast01 [
	self
		should: [ self empty last ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testLast02 [
	self assert: self nonEmpty last equals: false
]

{ #category : #tests }
SinglyLinkedListTest >> testLast03 [
	| newList |
	newList := self empty.
	newList addAll: (1 to: 11).
	self assert: newList last equals: 11
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond01 [
	| newList |
	newList := self empty.
	newList add: 1.
	self
		should: [ newList second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond02 [
	self
		should: [ self empty second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond03 [
	self assert: list second equals: -2
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAdd [

	| added collection |
	collection := self otherCollection.
	added := collection add: self element.
	self assert: added identicalTo: self element.
	self assert: (collection includes: self element).
	self assert: (self collectionWithElement includes: self element)
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAddAll [

	| added collection toBeAdded |
	collection := self collectionWithElement.
	toBeAdded := self otherCollection.
	added := collection addAll: toBeAdded.
	self assert: added identicalTo: toBeAdded.
	self assert: (collection includesAll: toBeAdded)
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAddTwice [

	| added oldSize collection anElement |
	collection := self collectionWithElement.
	anElement := self element.
	oldSize := collection size.
	added := collection
		         add: anElement;
		         add: anElement.
	self assert: added identicalTo: anElement.
	self assert: (collection includes: anElement).
	self assert: collection size equals: oldSize + 2
]
