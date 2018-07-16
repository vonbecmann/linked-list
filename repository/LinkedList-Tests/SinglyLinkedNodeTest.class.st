"
tests for a singly linked node.

"
Class {
	#name : #SinglyLinkedNodeTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests'
}

{ #category : #tests }
SinglyLinkedNodeTest >> testAsString [
	self assert: (SinglyLinkedNode with: 1) asString equals: 'SinglyLinkedNode(1)'.
	self assert: (SinglyLinkedNode with: 1 next: nil) asString equals: 'SinglyLinkedNode(1)'
]

{ #category : #tests }
SinglyLinkedNodeTest >> testEqual01 [
	| one another |
	one := SinglyLinkedNode with: 1.
	another := SinglyLinkedNode with: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
SinglyLinkedNodeTest >> testEqual02 [
	| one another |
	one := SinglyLinkedNode with: 1 next: nil.
	another := SinglyLinkedNode with: 1 next: nil.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
SinglyLinkedNodeTest >> testEqual03 [
	| next one another |
	next := SinglyLinkedNode with: 2.
	one := SinglyLinkedNode with: 1 next: next.
	another := SinglyLinkedNode with: 1 next: next.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]
