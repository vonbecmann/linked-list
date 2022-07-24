Class {
	#name : #DoublyLinkedListTest,
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
DoublyLinkedListTest >> classToBeTested [
	
	^ DoublyLinkedList
]

{ #category : #requirements }
DoublyLinkedListTest >> collectionClass [ 
	"Return the class to be used to create instances of the class tested"
	
	^ self classToBeTested
]

{ #category : #requirements }
DoublyLinkedListTest >> collectionMoreThan5Elements [
	" return a collection including at least 5 elements"

	^ 10 to: 17
]

{ #category : #requirements }
DoublyLinkedListTest >> collectionWithElement [
	"Returns a collection that already includes what is returned by #element."

	^ self empty
		add: self element;
		yourself
]

{ #category : #requirements }
DoublyLinkedListTest >> collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"

	^ list
]

{ #category : #requirements }
DoublyLinkedListTest >> element [
	"Returns an object that can be added to the collection returned by #collection."
	^ 13
]

{ #category : #requirements }
DoublyLinkedListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
DoublyLinkedListTest >> nonEmpty [
	^ list
]

{ #category : #requirements }
DoublyLinkedListTest >> otherCollection [
	"Returns a collection that does not include what is returned by #element."

	^ otherList
]

{ #category : #running }
DoublyLinkedListTest >> setUp [
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
DoublyLinkedListTest >> sizeCollection [
	"Answers a collection not empty"

	^ list
]

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundIfNoneWhenNobodyIsFound [
	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ true ] ifNone: [ false ].
	self deny: wasFound
]

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFound [
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

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ true ] ifNone: [ false ].
	self assert: wasFound
]

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundWhenNobodyIsFound [
	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ wasFound := true ].
	self deny: wasFound
]

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundWhenSomethingIsFound [
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

{ #category : #tests }
DoublyLinkedListTest >> testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ wasFound := true ].
	self assert: wasFound
]

{ #category : #tests }
DoublyLinkedListTest >> testDetectWhenNobodyIsFound [
	self should: [ self collectionWithoutNilElements detect: [ :each | each isNil ] ] raise: Error
]

{ #category : #tests }
DoublyLinkedListTest >> testFirst01 [
	self
		should: [ self empty first ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
DoublyLinkedListTest >> testFirst02 [
	self assert: self nonEmpty first equals: 1.2
]

{ #category : #tests }
DoublyLinkedListTest >> testLast01 [
	self
		should: [ self empty last ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
DoublyLinkedListTest >> testLast02 [
	self assert: self nonEmpty last equals: false
]

{ #category : #tests }
DoublyLinkedListTest >> testLast03 [
	| newList |
	newList := self empty.
	newList addAll: (1 to: 11).
	self assert: newList last equals: 11
]

{ #category : #tests }
DoublyLinkedListTest >> testReverseDo [
	| value |
	list := self empty.
	list addAll: (1 to: 10).
	value := 10.
	list
		reverseDo: [ :each | 
			self assert: each equals: value.
			value := value - 1 ]
]

{ #category : #tests }
DoublyLinkedListTest >> testSecond01 [
	| newList |
	newList := self empty.
	newList add: 1.
	self
		should: [ newList second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
DoublyLinkedListTest >> testSecond02 [
	self
		should: [ self empty second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
DoublyLinkedListTest >> testSecond03 [
	self assert: list second equals: -2
]
