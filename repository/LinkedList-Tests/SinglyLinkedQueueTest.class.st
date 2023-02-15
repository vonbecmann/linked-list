Class {
	#name : #SinglyLinkedQueueTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'nonEmpty'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #coverage }
SinglyLinkedQueueTest >> classToBeTested [
	^ SinglyLinkedQueue
]

{ #category : #requirements }
SinglyLinkedQueueTest >> empty [
	^ SinglyLinkedQueue new
]

{ #category : #requirements }
SinglyLinkedQueueTest >> nonEmpty [
	
 	^ nonEmpty
]

{ #category : #running }
SinglyLinkedQueueTest >> setUp [

	super setUp.
	nonEmpty := SinglyLinkedQueue new.
	nonEmpty nextPut: 1.
	nonEmpty nextPut: -2.
	nonEmpty nextPut: 3.
	nonEmpty nextPut: 1
]

{ #category : #requirements }
SinglyLinkedQueueTest >> sizeCollection [
	"Answers a collection not empty"

	^ nonEmpty
]

{ #category : #'tests - fixture' }
SinglyLinkedQueueTest >> test0FixtureCloneTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedQueueTest >> test0FixtureEmptyTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedQueueTest >> test0FixturePrintTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
SinglyLinkedQueueTest >> test0TSizeTest [
	self empty.
	self sizeCollection.
	self assertEmpty: self empty.
	self denyEmpty: self sizeCollection
]

{ #category : #'tests - copy - clone' }
SinglyLinkedQueueTest >> testCopyCreatesNewObject [
	 
	
	| copy | 
	copy := self nonEmpty copy.
	self deny: self nonEmpty == copy.
]

{ #category : #'tests - copy - clone' }
SinglyLinkedQueueTest >> testCopyEmpty [
	self assertEmpty: self empty copy
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIfEmpty [
	self nonEmpty ifEmpty: [ self assert: false ].
	self empty ifEmpty: [ self assert: true ]
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIfEmptyifNotEmpty [
	self assert: (self empty ifEmpty: [ true ] ifNotEmpty: [ false ]).
	self assert: (self nonEmpty ifEmpty: [ false ] ifNotEmpty: [ true ])
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIfNotEmpty [
	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self assert: (self nonEmpty ifNotEmpty: [ :s | s ]) = self nonEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIfNotEmptyifEmpty [
	self assert: (self empty ifNotEmpty: [ false ] ifEmpty: [ true ]).
	self assert: (self nonEmpty ifNotEmpty: [ true ] ifEmpty: [ false ])
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIsEmpty [
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testIsEmptyOrNil [
	self assert: self empty isEmptyOrNil.
	self deny: self nonEmpty isEmptyOrNil
]

{ #category : #'tests - empty' }
SinglyLinkedQueueTest >> testNotEmpty [
	self assert: self nonEmpty notEmpty.
	self deny: self empty notEmpty
]

{ #category : #'tests - printing' }
SinglyLinkedQueueTest >> testPrintElementsOn [

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
SinglyLinkedQueueTest >> testPrintNameOn [

	| aStream result |
	result := ''.
	aStream := ReadWriteStream on: result.
	self nonEmpty printNameOn: aStream.
	self nonEmpty class name first isVowel
		ifTrue: [ 
			self
				assert: aStream contents
				equals: 'an ' , self nonEmpty class name ]
		ifFalse: [ 
			self
				assert: aStream contents
				equals: 'a ' , self nonEmpty class name ]
]

{ #category : #'tests - printing' }
SinglyLinkedQueueTest >> testPrintOn [

	| aStream result allElementsAsString tmp |
	result := ''.
	aStream := ReadWriteStream on: result.
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	self nonEmpty printOn: aStream.
	allElementsAsString := result findBetweenSubstrings: ' '.
	1 to: allElementsAsString size do: [ :i | 
		i = 1 ifTrue: [ 
			self accessCollection class name first isVowel
				ifTrue: [ self assert: (allElementsAsString at: i) equals: 'an' ]
				ifFalse: [ self assert: (allElementsAsString at: i) equals: 'a' ] ].
		i = 2 ifTrue: [ 
			self
				assert: (allElementsAsString at: i)
				equals: self accessCollection class name ].
		i > 2 ifTrue: [ 
			self
				assert: (tmp occurrencesOf: (allElementsAsString at: i))
				equals:
				(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ] ]
]

{ #category : #'tests - printing' }
SinglyLinkedQueueTest >> testPrintOnDelimiter [
	
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
SinglyLinkedQueueTest >> testPrintOnDelimiterLast [

	| aStream result allElementsAsString tmp |
	result := ''.
	aStream := ReadWriteStream on: result.
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	self nonEmpty printOn: aStream delimiter: ', ' last: 'and'.

	allElementsAsString := result findBetweenSubstrings: ', '.
	1 to: allElementsAsString size do: [ :i | 
		i < (allElementsAsString size - 1) ifTrue: [ 
			self
				assert: (tmp occurrencesOf: (allElementsAsString at: i))
				equals:
				(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ].
		i = (allElementsAsString size - 1) ifTrue: [ 
			self deny: (allElementsAsString at: i) equals: 'and' asString ].
		i = allElementsAsString size ifTrue: [ 
			self
				assert: (tmp occurrencesOf: (allElementsAsString at: i))
				equals:
				(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ] ]
]

{ #category : #'tests - size capacity' }
SinglyLinkedQueueTest >> testSize [

	| size |
	self assert: self empty size = 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1].
	
	self assert: self sizeCollection size = size.
]
