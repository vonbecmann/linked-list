Class {
	#name : #AnotherDoublyLinkedListTest,
	#superclass : #TestCase,
	#instVars : [
		'list'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #running }
AnotherDoublyLinkedListTest >> setUp [

	super setUp.
	list := DoublyLinkedList new
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test01addLast [
	self assert: list isEmpty.
	list addLast: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test02addLast [
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
AnotherDoublyLinkedListTest >> test03Do [
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
AnotherDoublyLinkedListTest >> test04add [
	self assert: list isEmpty.
	list add: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test05add [
	self assert: list isEmpty.
	list
		add: 1;
		add: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test06removeFirst [

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
AnotherDoublyLinkedListTest >> test07removeAll [
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
AnotherDoublyLinkedListTest >> test08AsArray [

	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.

	self assert: list asArray equals: #(1 2 3 4)
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test09CollectCubes [
	| result |

	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.

	result := list collect: [ :each | each raisedTo: 3 ].

	self assert: result asArray equals: #(1 8 27 64)
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test10RemoveLast [
	| element result oldSize |
	list addAll: (1 to: 5).
	element := list last.
	oldSize := list size.
	result := list removeLast.

	self assert: result equals: element.
	self assert: list size equals: (oldSize - 1)
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test11RemoveLast [
	| element result oldSize |
	list add: 1.
	element := list last.
	oldSize := list size.
	result := list removeLast.

	self assert: result equals: element.
	self assert: list size equals: oldSize - 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test12RemoveLast [
	| element |
	list add: 1.
	element := list last.

	self assert: list size equals: 1.

	self assert: list removeLast equals: element.

	self assert: list size equals: 0
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test13RemoveLast [
	self
		should: [ list removeLast ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test14AddFirst [
	self assert: list isEmpty.
	list addFirst: 1.
	self deny: list isEmpty.
	self assert: list size equals: 1.
	self assert: list first equals: 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test15AddFirst [
	self assert: list isEmpty.
	list
		addFirst: 1;
		addFirst: 2.
	self deny: list isEmpty.
	self assert: list size equals: 2.
	self assert: list first equals: 2.
	self assert: list second equals: 1
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test16Sum [

	list
		add: 1;
		add: 2;
		add: 32.
	self assert: list sum equals: 35
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> test17Sum [

	self should: [ list sum ] raise: Error
]

{ #category : #tests }
AnotherDoublyLinkedListTest >> testReversed [
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
