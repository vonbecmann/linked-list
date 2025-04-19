"
I am doubly linked node, the elementary part of a doubly linked list.
"
Class {
	#name : 'DoublyLinkedNode',
	#superclass : 'Object',
	#instVars : [
		'value',
		'previousNode',
		'nextNode'
	],
	#category : 'LinkedList-Core-Base',
	#package : 'LinkedList-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
DoublyLinkedNode class >> with: anObject [
	"a singly linked node with an object as its value."

	^ self basicNew initializeValue: anObject
]

{ #category : 'instance creation' }
DoublyLinkedNode class >> with: anObject next: aNode [
	"a doubly linked node with an object as its value and a node as its successor"

	^ (self basicNew initializeValue: anObject)
			nextNode: aNode;
			yourself
]

{ #category : 'instance creation' }
DoublyLinkedNode class >> with: anObject previous: aNode [
	"a doubly linked node with an object as its value and a node as its predecessor"

	^ (self basicNew initializeValue: anObject)
		previousNode: aNode;
		yourself
]

{ #category : 'comparing' }
DoublyLinkedNode >> = anObject [
	^ self class == anObject class
		and: [ value = anObject value
				and: [ previousNode == anObject previousNode
						and: [ nextNode == anObject nextNode ] ] ]
]

{ #category : 'comparing' }
DoublyLinkedNode >> hash [
	^ (self class hash +
			(value hash	+ (previousNode identityHash + nextNode identityHash) hashMultiply)	hashMultiply)
					hashMultiply
]

{ #category : 'initialization' }
DoublyLinkedNode >> initializeValue: anObject [
	value := anObject
]

{ #category : 'accessing' }
DoublyLinkedNode >> nextNode [
	^ nextNode
]

{ #category : 'accessing' }
DoublyLinkedNode >> nextNode: aNode [
	nextNode := aNode
]

{ #category : 'accessing' }
DoublyLinkedNode >> previousNode [
	^ previousNode
]

{ #category : 'accessing' }
DoublyLinkedNode >> previousNode: aNode [
	previousNode := aNode
]

{ #category : 'printing' }
DoublyLinkedNode >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: value;
		nextPut: $)
]

{ #category : 'initialize-release' }
DoublyLinkedNode >> release [
	value := previousNode := nextNode := nil.
	super release
]

{ #category : 'accessing' }
DoublyLinkedNode >> value [
	^ value
]
