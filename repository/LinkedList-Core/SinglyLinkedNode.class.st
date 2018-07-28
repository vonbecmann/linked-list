"
I am singly linked node, the elementary part of a singly linked list.

I hold an object, as well as a reference to my successor (nextNode:)  - can be nil.

"
Class {
	#name : #SinglyLinkedNode,
	#superclass : #Object,
	#instVars : [
		'value',
		'nextNode'
	],
	#category : #'LinkedList-Core'
}

{ #category : #'instance creation' }
SinglyLinkedNode class >> with: anObject [
	"a singly linked node with an object as its value."

	^ self basicNew initializeValue: anObject
]

{ #category : #'instance creation' }
SinglyLinkedNode class >> with: anObject next: aNode [
	"a singly linked node with an object as its value and a node as its successor"

	^ (self basicNew initializeValue: anObject)
			nextNode: aNode;
			yourself
]

{ #category : #comparing }
SinglyLinkedNode >> = anObject [
	^ self class == anObject class
		and: [ value = anObject value and: [ nextNode == anObject nextNode ] ]
]

{ #category : #comparing }
SinglyLinkedNode >> hash [
	^ (self class hash + (value hash + nextNode identityHash) hashMultiply) hashMultiply
]

{ #category : #initialization }
SinglyLinkedNode >> initializeValue: anObject [
	value := anObject
]

{ #category : #accessing }
SinglyLinkedNode >> nextNode [
	^ nextNode
]

{ #category : #accessing }
SinglyLinkedNode >> nextNode: aNode [
	nextNode := aNode
]

{ #category : #printing }
SinglyLinkedNode >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: value;
		nextPut: $)
]

{ #category : #'initialize-release' }
SinglyLinkedNode >> release [
	value := nextNode := nil.
	super release
]

{ #category : #accessing }
SinglyLinkedNode >> value [
	^ value
]
