Class {
	#name : #DoublyLinkedNodeTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests-Base'
}

{ #category : #tests }
DoublyLinkedNodeTest >> testAsString [
	self
		assert: (DoublyLinkedNode with: 1) asString
		equals: 'DoublyLinkedNode(1)'.
	self
		assert: (DoublyLinkedNode with: 1 next: nil) asString
		equals: 'DoublyLinkedNode(1)'
]

{ #category : #tests }
DoublyLinkedNodeTest >> testEqual01 [
	| one another |
	one := DoublyLinkedNode with: 1.
	another := DoublyLinkedNode with: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
DoublyLinkedNodeTest >> testEqual02 [
	| one another |
	one := DoublyLinkedNode with: 1 next: nil.
	another := DoublyLinkedNode with: 1 next: nil.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
DoublyLinkedNodeTest >> testEqual03 [
	| next one another |
	next := DoublyLinkedNode with: 2.
	one := DoublyLinkedNode with: 1 next: next.
	another := DoublyLinkedNode with: 1 next: next.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]
