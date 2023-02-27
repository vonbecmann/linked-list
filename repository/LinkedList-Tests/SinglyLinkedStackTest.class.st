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
	self deny: self nonEmpty identicalTo: copy
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
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
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

	| printed allElementsAsString tmp |
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	printed := String streamContents: [ :s | 
		          self nonEmpty printElementsOn: s ].
	allElementsAsString := printed findBetweenSubstrings: '( )'.
	allElementsAsString do: [ :each | 
		self
			assert: (tmp occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each) ]
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintNameOn [

	| printed |
	printed := String streamContents: [ :s | self nonEmpty printNameOn: s ].
	self 
		assert: printed 
		equals: (self nonEmpty class name first isVowel
					 ifTrue: [ 'an ' ] ifFalse: [ 'a ' ]) , self nonEmpty class name
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOn [

	| tmp printed allElementsAsString |
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	printed := String streamContents: [ :s | self nonEmpty printOn: s ].
	allElementsAsString := printed findBetweenSubstrings: '( )'.
	allElementsAsString withIndexDo: [ :each :i | 
		i = 1 ifTrue: [ 
			self
				assert: each
				equals: (self classToBeTested class name first isVowel
						 ifTrue: [ 'an' ]
						 ifFalse: [ 'a' ]) ].
		i = 2 ifTrue: [ self assert: each equals: self classToBeTested name ].
		i > 2 ifTrue: [ 
			self
				assert: (tmp occurrencesOf: each)
				equals: (allElementsAsString occurrencesOf: each) ] ]
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOnDelimiter [

	| printed allElementsAsString tmp |
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].
	printed := String streamContents: [ :aStream | self nonEmpty printOn: aStream delimiter: ', ' ].

	allElementsAsString := printed findBetweenSubstrings: ', '.

	allElementsAsString
		collect: [ :each | 
			Array with: each with: (allElementsAsString occurrencesOf: each) ]
		thenDo: [ :each | 
			self assert: (tmp occurrencesOf: each first) equals: each second ]
]

{ #category : #'tests - printing' }
SinglyLinkedStackTest >> testPrintOnDelimiterLast [

	| printed allElementsAsString tmp |
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	printed := String streamContents: [ :s | 
		           self nonEmpty printOn: s delimiter: ', ' last: ' and ' ].

	allElementsAsString := printed findBetweenSubstrings: ', '.
	allElementsAsString withIndexDo: [ :each :i | 
		i = (allElementsAsString size - 1)
			ifTrue: [ self assert: each equals: 'and' ]
			ifFalse: [ 
				self
					assert: (tmp occurrencesOf: each)
					equals: (allElementsAsString occurrencesOf: each) ] ]
]

{ #category : #'tests - size capacity' }
SinglyLinkedStackTest >> testSize [

	| size |
	self assert: self empty size equals: 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1 ].
	self assert: self sizeCollection size equals: size
]
