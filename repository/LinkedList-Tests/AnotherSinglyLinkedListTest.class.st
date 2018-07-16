"
another tests for a singly linked list.

"
Class {
	#name : #AnotherSinglyLinkedListTest,
	#superclass : #TestCase,
	#instVars : [
		'list'
	],
	#category : #'LinkedList-Tests'
}

{ #category : #running }
AnotherSinglyLinkedListTest >> setUp [
	list := SinglyLinkedList new.
	
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test01addLast [
	self assert: list isEmpty.
	list addLast: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test02addLast [
	self assert: list isEmpty.
	list addLast: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1.
	list addLast: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test03Do [
	| sum |
	sum := 0.
	self assert: list isEmpty.
	list
		addLast: 1;
		addLast: 2;
		addLast: 3.
	list do: [ :each | sum := sum + each ].
	self deny: list isEmpty.
	self assert: sum equals: 6.
	self assert: list size equals: 3
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test04add [
	self assert: list isEmpty.
	list add: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test05add [
	self assert: list isEmpty.
	list
		add: 1;
		add: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test06removeFirst [
	
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	
	self assert: list size equals: 4.
	self assert: list first equals: 1.
	
	list removeFirst.
	self assert: list size equals: 3.
	self assert: list first equals: 2.
	
	list removeFirst.
	self assert: list size equals: 2.
	self assert: list first equals: 3.
	
	list removeFirst.
	self assert: list size equals: 1.
	self assert: list first equals: 4.
	
	list removeFirst.
	self assert: list isEmpty.
	self assert: list size equals: 0
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test07removeAll [
	| copied |
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	copied := list copy.
	list removeAll.
	self assert: list size equals: 0.
	self assert: copied size equals: 4
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test08AsArray [

	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.

	self assert: list asArray equals: #(1 2 3 4)
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> test09CollectCubes [
	| result |
	
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	
	result := list collect: [ :each | each raisedTo: 3 ].
	
	self assert: result asArray equals: #(1 8 27 64)
]

{ #category : #tests }
AnotherSinglyLinkedListTest >> testReversed [
	| reversed |
	self assert: list isEmpty.
	list
		add: 2;
		add: 3.
	self deny: list isEmpty.
	reversed := list reversed.
	self deny: reversed isEmpty.
	self assert: reversed size equals: 2.
	self assert: reversed first equals: 3.
	self assert: reversed second equals: 2
]
