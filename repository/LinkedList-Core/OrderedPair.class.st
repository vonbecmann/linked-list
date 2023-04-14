"
an ordered pair of objects.

(first, second)

first - an object.
second - an object.

In mathematics, an ordered pair (a, b) is a pair of mathematical objects. The order in which the objects appear in the pair is significant: the ordered pair (a, b) is different from the ordered pair (b, a) unless a = b.
Let ( a1 , b1 )  and ( a2 , b2 )  be ordered pairs. Then the characteristic (or defining) property of the ordered pair is:

    ( a1 , b1 ) = ( a2 , b2 ) if and only if a1 = a2  and  b1 = b2 .

"
Class {
	#name : #OrderedPair,
	#superclass : #Object,
	#instVars : [
		'first',
		'second'
	],
	#category : #'LinkedList-Core-Pair'
}

{ #category : #'instance creation' }
OrderedPair class >> empty [
	^ self basicNew
]

{ #category : #'instance creation' }
OrderedPair class >> first: firstObject [
	^ self basicNew
		first: firstObject;
		yourself
]

{ #category : #'instance creation' }
OrderedPair class >> first: firstObject second: secondObject [
	^ self basicNew
		first: firstObject;
		second: secondObject;
		yourself
]

{ #category : #'instance creation' }
OrderedPair class >> second: secondObject [
	^ self basicNew
		second: secondObject;
		yourself
]

{ #category : #comparing }
OrderedPair >> = aPair [
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ first = aPair first and: [ second = aPair second ]
]

{ #category : #displaying }
OrderedPair >> displayStringOn: aStream [
	aStream
		nextPut: $(;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $)
]

{ #category : #accessing }
OrderedPair >> first [
	^ first
]

{ #category : #accessing }
OrderedPair >> first: anObject [
	first := anObject
]

{ #category : #comparing }
OrderedPair >> hash [
	^ (first hash + second hash) hashMultiply
]

{ #category : #printing }
OrderedPair >> printOn: aStream [

	aStream
		nextPutAll: self className;
		nextPut: $(;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $)
]

{ #category : #accessing }
OrderedPair >> second [
	^ second
]

{ #category : #accessing }
OrderedPair >> second: anObject [
	second := anObject
]
