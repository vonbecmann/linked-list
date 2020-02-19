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
AnotherAssociationListTest >> testDetectWhenNotFound [
	self should: [ alist detect: [ :each | false ] ] raise: Error
]

{ #category : #tests }
AnotherAssociationListTest >> testErrorValueNotFound [
	self should: [ alist keyAtValue: 1 ] raise: Error
]
