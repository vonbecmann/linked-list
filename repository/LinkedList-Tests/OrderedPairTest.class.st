"
tests for ordered pair.

"
Class {
	#name : #OrderedPairTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests-Pair'
}

{ #category : #tests }
OrderedPairTest >> testAsString [
	| one |
	one := OrderedPair first: 'A' second: 1.

	self assert: one asString equals: 'OrderedPair(''A'', 1)'
]

{ #category : #tests }
OrderedPairTest >> testDisplayString [
	| one |
	one := OrderedPair first: 'A' second: 1.

	self assert: one displayString equals: '(''A'', 1)'
]

{ #category : #tests }
OrderedPairTest >> testEmpty [
	| one |
	one := OrderedPair empty.
	self assert: one first equals: nil.
	self assert: one second equals: nil
]

{ #category : #tests }
OrderedPairTest >> testEquality [

	| one another |
	one := OrderedPair first: 'A' second: 1.
	another := OrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
OrderedPairTest >> testEquality01 [

	| one another |
	one := another := OrderedPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one identicalTo: another
]

{ #category : #tests }
OrderedPairTest >> testEquality02 [

	| one another |
	one := OrderedPair first: 'A' second: 1.
	another := OrderedPair first: 'A' second: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
OrderedPairTest >> testEquality03 [

	| one another |
	one := OrderedPair first: 'A' second: 1.
	another := OrderedPair first: 'B' second: 1.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
OrderedPairTest >> testFirst [
	| one |
	one := OrderedPair first: 'A'.
	self assert: one first equals: 'A'.
	self assert: one second equals: nil
]

{ #category : #tests }
OrderedPairTest >> testFirstSecond [
	| one |
	one := OrderedPair first: 'B' second: 'A'.
	self assert: one first equals: 'B'.
	self assert: one second equals: 'A'
]

{ #category : #tests }
OrderedPairTest >> testSecond [
	| one |
	one := OrderedPair second: 'A'.
	self assert: one first equals: nil.
	self assert: one second equals: 'A'
]
