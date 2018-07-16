Class {
	#name : #SinglyLinkedStackTest,
	#superclass : #ClassTestCase,
	#traits : 'TEmptyTest + TSizeTest + (TCloneTest - {#testCopyNonEmpty}) + (TPrintTest - {#testStoreOn})',
	#classTraits : 'TEmptyTest classTrait + TSizeTest classTrait + TCloneTest classTrait + TPrintTest classTrait',
	#instVars : [
		'nonEmpty'
	],
	#classInstVars : [
		'testSize'
	],
	#category : #'LinkedList-Tests'
}

{ #category : #coverage }
SinglyLinkedStackTest >> classToBeTested [
	^ SinglyLinkedStack
]

{ #category : #requirements }
SinglyLinkedStackTest >> empty [
	^ SinglyLinkedStack new
]

{ #category : #requirements }
SinglyLinkedStackTest >> nonEmpty [
	
 	^ nonEmpty
]

{ #category : #running }
SinglyLinkedStackTest >> setUp [
	nonEmpty := SinglyLinkedStack new.
	nonEmpty push: 1.
	nonEmpty push: -2.
	nonEmpty push: 3.
	nonEmpty push: 1
]

{ #category : #requirements }
SinglyLinkedStackTest >> sizeCollection [
	"Answers a collection not empty"

	^ nonEmpty
]
