"
an identity ordered pair.

 < a1 , b1 > = < a2 , b2 > if and only if a1 == a2  and  b1 == b2 .
"
Class {
	#name : 'IdentityOrderedPair',
	#superclass : 'OrderedPair',
	#category : 'LinkedList-Core-Pair',
	#package : 'LinkedList-Core',
	#tag : 'Pair'
}

{ #category : 'comparing' }
IdentityOrderedPair >> = aPair [
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ first == aPair first and: [ second == aPair second ]
]

{ #category : 'displaying' }
IdentityOrderedPair >> displayStringOn: aStream [

	aStream nextPut: $<.
	first displayStringOn: aStream.
	aStream nextPutAll: ', '.
	second displayStringOn: aStream.
	aStream nextPut: $>
]

{ #category : 'comparing' }
IdentityOrderedPair >> hash [
	^ (first identityHash + second identityHash) hashMultiply
]

{ #category : 'printing' }
IdentityOrderedPair >> printOn: aStream [

	aStream
		nextPutAll: self className;
		nextPut: $<;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $>
]
