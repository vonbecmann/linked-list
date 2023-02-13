Class {
	#name : #SinglyLinkedStackTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'nonEmpty'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #coverage }
SinglyLinkedStackTest >> classToBeTested [
	^ SinglyLinkedStack
]

{ #category : #requirements }
SinglyLinkedStackTest >> empty [
	^ SinglyLinkedStack new
]

{ #category : #requirements }
SinglyLinkedStackTest >> nonEmpty [
	
 	^ nonEmpty
]

{ #category : #running }
SinglyLinkedStackTest >> setUp [

	super setUp.
	nonEmpty := SinglyLinkedStack new.
	nonEmpty push: 1.
	nonEmpty push: -2.
	nonEmpty push: 3.
	nonEmpty push: 1
]

{ #category : #requirements }
SinglyLinkedStackTest >> sizeCollection [
	"Answers a collection not empty"

	^ nonEmpty
]

{ #category : #'tests - fixture' }
SinglyLinkedStackTest >> test0FixtureCloneTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedStackTest >> test0FixtureEmptyTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedStackTest >> test0FixturePrintTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
SinglyLinkedStackTest >> test0TSizeTest [
	self empty.
	self sizeCollection.
	self assertEmpty: self empty.
	self denyEmpty: self sizeCollection
]

{ #category : #'tests - copy - clone' }
SinglyLinkedStackTest >> testCopyCreatesNewObject [
	 
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: self nonEmpty == copy.
]

{ #category : #'tests - copy - clone' }
SinglyLinkedStackTest >> testCopyEmpty [
	self assertEmpty: self empty copy
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIfEmpty [
	self nonEmpty ifEmpty: [ self assert: false ].
	self empty ifEmpty: [ self assert: true ]
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIfEmptyifNotEmpty [
	self assert: (self empty ifEmpty: [ true ] ifNotEmpty: [ false ]).
	self assert: (self nonEmpty ifEmpty: [ false ] ifNotEmpty: [ true ])
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIfNotEmpty [
	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self assert: (self nonEmpty ifNotEmpty: [ :s | s ]) = self nonEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIfNotEmptyifEmpty [
	self assert: (self empty ifNotEmpty: [ false ] ifEmpty: [ true ]).
	self assert: (self nonEmpty ifNotEmpty: [ true ] ifEmpty: [ false ])
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIsEmpty [
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testIsEmptyOrNil [
	self assert: self empty isEmptyOrNil.
	self deny: self nonEmpty isEmptyOrNil
]

{ #category : #'tests - empty' }
SinglyLinkedStackTest >> testNotEmpty [
	self assert: self nonEmpty notEmpty.
	self deny: self empty notEmpty
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintElementsOn [

	| aStream result allElementsAsString tmp |
	result:=''.
	aStream:= ReadWriteStream on: result.
	tmp:= OrderedCollection new.
	self nonEmpty do: [:each | tmp add: each asString].
	
	self nonEmpty printElementsOn: aStream .
	allElementsAsString:=(result findBetweenSubstrings: ' ' ).
	1 to: allElementsAsString size do:
		[:i | 
		self assert: (tmp occurrencesOf:(allElementsAsString at:i))=(allElementsAsString  occurrencesOf:(allElementsAsString at:i)).
			].
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintNameOn [

	| aStream result |
	result:=''.
	aStream:= ReadWriteStream on: result.
	self nonEmpty printNameOn: aStream.
	self nonEmpty class name first isVowel
		ifTrue:[ self assert: aStream contents =('an ',self nonEmpty class name ) ]
		ifFalse:[self assert: aStream contents =('a ',self nonEmpty class name)].
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOn [
	| aStream result allElementsAsString tmp |
	result:=''.
	aStream:= ReadWriteStream on: result.
	tmp:= OrderedCollection new.
	self nonEmpty do: [:each | tmp add: each asString].
	
	self nonEmpty printOn: aStream .
	allElementsAsString:=(result findBetweenSubstrings: ' ' ).
	1 to: allElementsAsString size do:
		[:i | 
		i=1
			ifTrue:[
			self accessCollection class name first isVowel 
				ifTrue:[self assert: (allElementsAsString at:i)='an' ]
				ifFalse:[self assert: (allElementsAsString at:i)='a'].].
		i=2
			ifTrue:[self assert: (allElementsAsString at:i)=self accessCollection class name].
		i>2
			ifTrue:[self assert: (tmp occurrencesOf:(allElementsAsString at:i))=(allElementsAsString  occurrencesOf:(allElementsAsString at:i)).].	
			].
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOnDelimiter [
	
	| result allElementsAsString tmp |
	
	result := String streamContents: [ :aStream |
		tmp := OrderedCollection new.
		self nonEmpty do: [:each | tmp add: each asString].
		self nonEmpty printOn: aStream delimiter: ', ' ].
	
	allElementsAsString := (result findBetweenSubstrings: ', ').
	
	1 to: allElementsAsString size do:
		[:i | 
		self assert: (tmp occurrencesOf:(allElementsAsString at:i)) equals: (allElementsAsString  occurrencesOf:(allElementsAsString at:i)) ].
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOnDelimiterLast [

	| aStream result allElementsAsString tmp |
	result:=''.
	aStream:= ReadWriteStream on: result.
	tmp:= OrderedCollection new.
	self nonEmpty do: [:each | tmp add: each asString].
	
	self nonEmpty printOn: aStream delimiter: ', ' last: 'and'.
	
	allElementsAsString:=(result findBetweenSubstrings: ', ' ).
	1 to: allElementsAsString size do:
		[:i | 
		i<(allElementsAsString size-1 )
			ifTrue: [self assert: (tmp occurrencesOf: (allElementsAsString at:i))=(allElementsAsString  occurrencesOf: (allElementsAsString at:i))].
		i=(allElementsAsString size-1)
			ifTrue:[ self deny: (allElementsAsString at:i)=('and')asString].
		i=(allElementsAsString size)
			ifTrue: [self assert: (tmp occurrencesOf: (allElementsAsString at:i))=(allElementsAsString  occurrencesOf: (allElementsAsString at:i))].
			].
]

{ #category : #'tests - size capacity' }
SinglyLinkedStackTest >> testSize [

	| size |
	self assert: self empty size = 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1].
	
	self assert: self sizeCollection size = size.
]
