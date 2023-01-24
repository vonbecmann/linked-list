"
tests for identity ordered pair.

"
Class {
	#name : #IdentityOrderedPairTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests-Pair'
}

{ #category : #tests }
IdentityOrderedPairTest >> testAsString [
	| one |
	one := IdentityOrderedPair first: 'A' second: 1.

	self assert: one asString equals: '<''A'', 1>'
]

{ #category : #tests }
IdentityOrderedPairTest >> testEmpty [
	| one |
	one := IdentityOrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil
]

{ #category : #tests }
IdentityOrderedPairTest >> testEquality [

	| one another |
	one := IdentityOrderedPair first: 'A' second: 1.
	another := IdentityOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
IdentityOrderedPairTest >> testEquality01 [

	| one another |
	one := another := IdentityOrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one identicalTo: another
]

{ #category : #tests }
IdentityOrderedPairTest >> testEquality02 [

	| one another |
	one := IdentityOrderedPair first: 'A' second: 1.
	another := IdentityOrderedPair first: 'A' second: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
IdentityOrderedPairTest >> testEquality03 [

	| one another |
	one := IdentityOrderedPair first: 'A' second: 1.
	another := IdentityOrderedPair first: 'B' second: 1.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
IdentityOrderedPairTest >> testFirst [
	| one |
	one := IdentityOrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil
]

{ #category : #tests }
IdentityOrderedPairTest >> testFirstSecond [
	| one |
	one := IdentityOrderedPair first: 'B' second: 'A'.
	self assert: one first equals: 'B'.
	self assert: one second equals: 'A'
]

{ #category : #tests }
IdentityOrderedPairTest >> testSecond [
	| one |
	one := IdentityOrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'
]
