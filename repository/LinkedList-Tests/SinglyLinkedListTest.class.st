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
