Class {
	#name : #AnotherIdentityAssociationListTest,
	#superclass : #AnotherAssociationListTest,
	#category : #'LinkedList-Tests-Dictionaries'
}

{ #category : #running }
AnotherIdentityAssociationListTest >> setUp [
	super setUp.
	alist := IdentityAssociationList new
]

{ #category : #tests }
AnotherIdentityAssociationListTest >> testAtPut [
	| key |
	key := 'key'.
	alist at: key put: true.
	self assert: (alist includesKey: key).
	self deny: (alist at: key copy ifAbsent: [ false ])
]

{ #category : #tests }
AnotherIdentityAssociationListTest >> testIdentity [
	| dict key |
	dict := IdentityAssociationList new.
	key := 'key'.
	dict at: key put: 2.5.
	self assert: (dict includesKey: key).
	self deny: (dict includesKey: key copy)
]
