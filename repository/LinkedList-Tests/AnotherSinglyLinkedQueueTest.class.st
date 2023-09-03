"
tests for singly linked queue.

"
Class {
	#name : #AnotherSinglyLinkedQueueTest,
	#superclass : #TestCase,
	#instVars : [
		'queue'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #running }
AnotherSinglyLinkedQueueTest >> setUp [
	super setUp.
	queue := SinglyLinkedQueue new
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testAsArray [
	queue
		nextPut: 1;
		nextPut: 2;
		nextPut: 3;
		nextPut: 4.
	self assert: queue size equals: 4.
	self assert: queue asArray equals: #(1 2 3 4)
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testHeadWhenIsEmpty [
	self assert: queue isEmpty.
	self should: [ queue head ] raise: Error
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testHeadWhenIsNotEmpty [
	self assert: queue isEmpty.
	queue nextPut: 83.
	queue nextPut: 42.
	self deny: queue isEmpty.
	self assert: queue size equals: 2.

	self assert: queue head equals: 83.
	self assert: queue size equals: 2.

	self assert: queue head equals: 83.
	self assert: queue size equals: 2
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testNextPutWhenIsEmpty [
	self assert: queue isEmpty.
	queue nextPut: 43.
	self deny: queue isEmpty.
	self assert: queue size equals: 1.
	self assert: queue peek equals: 43
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testNextPutWhenIsNotEmpty [
	self assert: queue isEmpty.

	queue nextPut: 83.
	queue nextPut: 42.

	self deny: queue isEmpty.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 83
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testNextWhenIsEmpty [
	self assert: queue isEmpty.
	self assert: queue next isNil
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testNextWhenIsNotEmpty [
	self assert: queue isEmpty.
	queue nextPut: 1.
	queue nextPut: 12.
	self deny: queue isEmpty.
	self assert: queue next equals: 1.
	self assert: queue next equals: 12.
	self assert: queue next isNil
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testPeekWhenIsEmpty [
	self assert: queue isEmpty.
	self assert: queue peek isNil
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testPeekWhenIsNotEmpty [
	self assert: queue isEmpty.
	queue nextPut: 1.
	queue nextPut: 12.
	self deny: queue isEmpty.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 1.
	self assert: queue size equals: 2.
	self assert: queue peek equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testRemoveAll [
	| copied |
	queue nextPut: 1.
	queue nextPut: 2.
	queue nextPut: 3.
	queue nextPut: 4.
	copied := queue copy.
	self assert: queue size equals: 4.
	queue removeAll.
	self assert: queue size equals: 0.
	self assert: copied size equals: 4
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testRemoveHeadWhenIsEmpty [
	self assert: queue isEmpty.
	self should: [ queue removeHead ] raise: Error
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testRemoveHeadWhenIsNotEmpty [
	self assert: queue isEmpty.
	queue nextPut: 83.
	queue nextPut: 42.
	self deny: queue isEmpty.
	self assert: queue size equals: 2.

	self assert: queue removeHead equals: 83.
	self assert: queue size equals: 1.

	self assert: queue removeHead equals: 42.
	self assert: queue isEmpty.
	self assert: queue size equals: 0
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testSize [
	self assert: queue isEmpty.

	#(1 2 3 4 5 6 7 8 9 10) do: [ :each | queue nextPut: each ].

	self deny: queue isEmpty.
	self assert: queue size equals: 10
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testWith [
	| q |
	q := SinglyLinkedQueue with: 7.9.
	self assert: q size equals: 1.
	self assert: q head equals: 7.9
]

{ #category : #tests }
AnotherSinglyLinkedQueueTest >> testWithAll [
	| q |
	q := SinglyLinkedQueue withAll: (11 to: 21).
	self assert: q size equals: 11.
	self assert: q head equals: 11
]
