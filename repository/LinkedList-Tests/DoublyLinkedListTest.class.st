Class {
	#name : #DoublyLinkedListTest,
	#superclass : #ClassTestCase,
	#traits : 'TIterateTest + TEmptyTest + TSizeTest + (TPrintTest - {#testStoreOn}) + (TAddTest - {#testTAddIfNotPresentWithElementAlreadyIn. #testTAddIfNotPresentWithNewElement. #testTAddWithOccurences. #testTWrite. #testTWriteTwice})',
	#classTraits : 'TIterateTest classTrait + TEmptyTest classTrait + TSizeTest classTrait + TPrintTest classTrait + TAddTest classTrait',
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
