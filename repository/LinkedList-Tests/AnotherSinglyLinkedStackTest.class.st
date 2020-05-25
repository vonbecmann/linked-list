"
tests for singly linked stack
"
Class {
	#name : #AnotherSinglyLinkedStackTest,
	#superclass : #TestCase,
	#instVars : [
		'stack'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #running }
AnotherSinglyLinkedStackTest >> setUp [
	stack := SinglyLinkedStack new
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test01StackShouldBeEmptyWhenCreated [
	self assert: stack isEmpty
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test02PushAddElementsToTheStack [

	stack push: 'Something'.

	self deny: stack isEmpty
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test03PopRemovesElementsFromTheStack [

	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test04PopReturnsLastPushedObject [
	| pushedObject |
	pushedObject := 'Something'.

	stack push: pushedObject.

	self assert: stack pop equals: pushedObject
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test05StackBehavesLIFO [
	| firstPushedObject secondPushedObject |
	
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop equals: secondPushedObject.
	self assert: stack pop equals: firstPushedObject.
	self assert: stack isEmpty
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test06TopReturnsLastPushedObject [
	| pushedObject |
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top equals: pushedObject
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test07TopDoesNotRemoveObjectFromStack [

	| pushedObject |
	
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test08CanNotPopWhenThereAreNoObjectsInTheStack [
	self
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects [

	stack push: 'Something'.
	stack pop.

	self
		should: [ stack pop ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> test10CanNotTopWhenThereAreNoObjectsInTheStack [
	self
		should: [ stack top ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testAsArray [
	stack
		push: 1;
		push: 2;
		push: 3;
		push: 4.
	self assert: stack size equals: 4.
	self assert: stack asArray equals: #(4 3 2 1)
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testEmptyError [
	self should: [ stack top ] raise: Error.
	self should: [ stack pop ] raise: Error.
	stack push: 'element'.
	stack top.
	stack pop.	"The stack is empty again due to previous pop"
	self should: [ stack top ] raise: Error.
	self should: [ stack pop ] raise: Error
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testPop [
	self should: [ stack pop ] raise: Error
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testPop02 [
	| anObject |
	anObject := 'hola'.
	stack push: anObject.
	self assert: stack pop equals: anObject.
	self assert: stack isEmpty.
	self assert: stack size equals: 0
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testPop03 [

	| res elem |
	elem := 'anElement'.	
	self assert: stack isEmpty.
	
	stack push: 'a'.
	stack push: elem.
	res := stack pop.	
	self assert: res equals: elem.
	self assert: res == elem.
	
	self assert: stack size equals: 1.
	stack pop.
	self assert: stack isEmpty.


]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testPush [
	stack push: 'hola'.
	self deny: stack isEmpty.
	self assert: stack size equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testPush02 [
	stack push: 'a'.
	self assert: stack size equals: 1.
	stack push: 'b'.
	self assert: stack size equals: 2
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testRemoveAll [
	| copied |
	stack push: 1.
	stack push: 2.
	stack push: 3.
	stack push: 4.
	copied := stack copy.
	self assert: stack size equals: 4.
	stack removeAll.
	self assert: stack size equals: 0.
	self assert: copied size equals: 4
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testTop [
	| anObject |
	anObject := 'hola'.
	stack push: anObject.
	self assert: stack size equals: 1.
	self assert: stack top equals: anObject.
	self assert: stack size equals: 1
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testTop02 [
	self should: [ stack top ] raise: Error
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testTop03 [
	self assert: stack isEmpty.
	stack push: 'a'.
	stack push: 'b'.
	self assert: stack top equals: 'b'.
	self assert: stack top equals: 'b'.
	self assert: stack size equals: 2
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testWith [
	| newStack |
	newStack := SinglyLinkedStack with: 7.9.
	self assert: newStack size equals: 1.
	self assert: newStack top equals: 7.9
]

{ #category : #tests }
AnotherSinglyLinkedStackTest >> testWithAll [
	| newStack |
	newStack := SinglyLinkedStack withAll: (11 to: 21).
	self assert: newStack size equals: 11.
	self assert: newStack top equals: 21
]
