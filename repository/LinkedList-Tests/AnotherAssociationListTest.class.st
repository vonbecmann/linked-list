Class {
	#name : #AnotherAssociationListTest,
	#superclass : #TestCase,
	#instVars : [
		'alist'
	],
	#category : #'LinkedList-Tests'
}

{ #category : #running }
AnotherAssociationListTest >> setUp [
	super setUp.
	alist := AssociationList new
]

{ #category : #tests }
AnotherAssociationListTest >> testDetectWhenNotFound [
	self should: [ alist detect: [ :each | false ] ] raise: NotFound
]
