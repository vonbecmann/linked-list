Class {
	#name : #AnotherAssociationListTest,
	#superclass : #TestCase,
	#instVars : [
		'alist'
	],
	#category : #'LinkedList-Tests-Dictionaries'
}

{ #category : #running }
AnotherAssociationListTest >> setUp [
	super setUp.
	alist := AssociationList new
]

{ #category : #tests }
AnotherAssociationListTest >> testAnyOneWhenEmpty [
	self should: [ alist anyOne ] raise: Error
]

{ #category : #tests }
AnotherAssociationListTest >> testDetectWhenNotFound [
	self should: [ alist detect: [ :each | false ] ] raise: Error
]

{ #category : #tests }
AnotherAssociationListTest >> testErrorValueNotFound [
	self should: [ alist keyAtValue: 1 ] raise: Error
]

{ #category : #tests }
AnotherAssociationListTest >> testRemoveKey [
	alist at: 1 put: true.
	alist at: 2 put: 'second'.

	self assert: alist size equals: 2.
	self assert: (alist removeKey: 2) equals: 'second'.
	self assert: alist size equals: 1
]

{ #category : #tests }
AnotherAssociationListTest >> testRemoveKey02 [
	alist at: 1 put: 'first'.

	self assert: alist size equals: 1.
	self assert: (alist removeKey: 1) equals: 'first'.
	self assert: alist size equals: 0
]

{ #category : #tests }
AnotherAssociationListTest >> testRemoveKey03 [
	alist at: 1 put: true.
	alist at: 2 put: 'second'.
	alist at: 3 put: false.

	self assert: alist size equals: 3.
	self assert: (alist removeKey: 2) equals: 'second'.
	self assert: alist size equals: 2
]
