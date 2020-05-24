Class {
	#name : #DoublyLinkedListTest,
	#superclass : #ClassTestCase,
	#traits : 'TIterateTest + TEmptyTest',
	#classTraits : 'TIterateTest classTrait + TEmptyTest classTrait',
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
DoublyLinkedListTest >> collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"

	^ list
]

{ #category : #requirements }
DoublyLinkedListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
DoublyLinkedListTest >> nonEmpty [
	^ list
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
