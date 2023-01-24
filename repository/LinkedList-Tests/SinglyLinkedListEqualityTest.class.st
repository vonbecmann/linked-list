"
equality tests.

"
Class {
	#name : #SinglyLinkedListEqualityTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual01 [

	| one another |
	one := SinglyLinkedList with: 1.
	another := SinglyLinkedList with: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual02 [

	| one another |
	one := SinglyLinkedList new.
	another := SinglyLinkedList new.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual03 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2 with: 3.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual04 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 3 with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual05 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2 with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual06 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListEqualityTest >> testEqual07 [

	| one another |
	one := SinglyLinkedList with: 2.
	another := SinglyLinkedList with: 2 with: 3.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]
