Class {
	#name : #SinglyLinkedQueueTest,
	#superclass : #ClassTestCase,
	#traits : 'TEmptyTest + TSizeTest + (TCloneTest - {#testCopyNonEmpty}) + (TPrintTest - {#testStoreOn})',
	#classTraits : 'TEmptyTest classTrait + TSizeTest classTrait + TCloneTest classTrait + TPrintTest classTrait',
	#instVars : [
		'nonEmpty'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #coverage }
SinglyLinkedQueueTest >> classToBeTested [
	^ SinglyLinkedQueue
]

{ #category : #requirements }
SinglyLinkedQueueTest >> empty [
	^ SinglyLinkedQueue new
]

{ #category : #requirements }
SinglyLinkedQueueTest >> nonEmpty [
	
 	^ nonEmpty
]

{ #category : #running }
SinglyLinkedQueueTest >> setUp [

	super setUp.
	nonEmpty := SinglyLinkedQueue new.
	nonEmpty nextPut: 1.
	nonEmpty nextPut: -2.
	nonEmpty nextPut: 3.
	nonEmpty nextPut: 1
]

{ #category : #requirements }
SinglyLinkedQueueTest >> sizeCollection [
	"Answers a collection not empty"

	^ nonEmpty
]
