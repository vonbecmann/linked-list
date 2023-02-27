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
	self deny: self nonEmpty identicalTo: copy
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
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
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
SinglyLinkedQueueTest >> testPrintNameOn [

	| printed |
	printed := String streamContents: [ :s | self nonEmpty printNameOn: s ].
	
	self 
		assert: printed 
		equals: (self nonEmpty class name first isVowel ifTrue: [ 'an ' ] ifFalse: [ 'a ' ]) , self nonEmpty class name
]

{ #category : #'tests - printing' }
SinglyLinkedQueueTest >> testPrintOn [

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
SinglyLinkedQueueTest >> testPrintOnDelimiter [

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
SinglyLinkedQueueTest >> testPrintOnDelimiterLast [

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
SinglyLinkedQueueTest >> testSize [

	| size |
	self assert: self empty size equals: 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1 ].
	self assert: self sizeCollection size equals: size
]
