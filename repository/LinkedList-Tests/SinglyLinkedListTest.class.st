Class {
	#name : #SinglyLinkedListTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'list',
		'otherList'
	],
	#category : #'LinkedList-Tests-Sequenceable'
}

{ #category : #coverage }
SinglyLinkedListTest >> classToBeTested [
	^ SinglyLinkedList
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionClass [
	^ self classToBeTested
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionMoreThan5Elements [
	" return a collection including at least 5 elements"

	^ 10 to: 17
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionWithElement [
	"Returns a collection that already includes what is returned by #element."

	^ self empty
		add: self element;
		yourself
]

{ #category : #requirements }
SinglyLinkedListTest >> collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"

	^ list
]

{ #category : #requirements }
SinglyLinkedListTest >> element [
	"Returns an object that can be added to the collection returned by #collection."

	^ 13
]

{ #category : #requirements }
SinglyLinkedListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
SinglyLinkedListTest >> nonEmpty [
	^ list
]

{ #category : #requirements }
SinglyLinkedListTest >> otherCollection [
	"Returns a collection that does not include what is returned by #element."

	^ otherList
]

{ #category : #coverage }
SinglyLinkedListTest >> selectorsToBeIgnored [

	| private |
	private := #( #initialize #errorNotFound: #emptyError #firstNode #gtInspectorItemsIn: #postCopy).
	^ super selectorsToBeIgnored, private
]

{ #category : #running }
SinglyLinkedListTest >> setUp [
	super setUp.
	list := self empty.
	list
		add: 1.2;
		add: -2;
		add: 7;
		add: true;
		add: false.
	otherList := self empty
		addAll: (7 to: 11);
		yourself
]

{ #category : #requirements }
SinglyLinkedListTest >> sizeCollection [
	"Answers a collection not empty"

	^ list
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureCloneTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureCreationWithTest [

	self collectionMoreThan5Elements.
	self assert: self collectionMoreThan5Elements size >= 5
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureEmptyTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureIterateTest [

	| res |
	self collectionWithoutNilElements.
	self
		assert: (self collectionWithoutNilElements occurrencesOf: nil)
		equals: 0.
	res := true.
	self collectionWithoutNilElements
		detect: [ :each |
		(self collectionWithoutNilElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self deny: res
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixturePrintTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0FixtureRequirementsOfTAddTest [

	self collectionWithElement.
	self otherCollection.
	self element.
	self assert: (self collectionWithElement includes: self element).
	self deny: (self otherCollection includes: self element)
]

{ #category : #'tests - fixture' }
SinglyLinkedListTest >> test0TSizeTest [
	self empty.
	self sizeCollection.
	self assertEmpty: self empty.
	self denyEmpty: self sizeCollection
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testAllSatisfy [

	| element |
	" when all element  satisfy the condition, should return true : "
	self assert:
		(self collectionWithoutNilElements allSatisfy: [ :each |
			 each notNil ]).

	" when all element don't satisfy the condition, should return false : "
	self deny: (self collectionWithoutNilElements allSatisfy: [ :each |
			 each notNil not ]).

	" when only one element doesn't satisfy the condition' should return false'"
	element := self collectionWithoutNilElements anyOne.
	self deny: (self collectionWithoutNilElements allSatisfy: [ :each |
			 each ~= element ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testAllSatisfyEmpty [

	self assert: ( self empty allSatisfy: [:each | false])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testAnySastify [

	| element |
	" when all elements satisty the condition, should return true :"
	self assert: ( self collectionWithoutNilElements anySatisfy: [:each | each notNil ]).

	" when only one element satisfy the condition, should return true :"
	element := self collectionWithoutNilElements anyOne.
	self assert: ( self collectionWithoutNilElements  anySatisfy: [:each | (each = element)  ]   ).

	" when all elements don't satisty the condition, should return false :"
	self deny: ( self collectionWithoutNilElements anySatisfy: [:each | (each notNil) not ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testBasicCollect [

	| res index |
	index := 0.
	res := self collectionWithoutNilElements collect: [ :each |
		       index := index + 1.
		       each ].

	res do: [ :each |
		self
			assert: (self collectionWithoutNilElements occurrencesOf: each)
			equals: (res occurrencesOf: each) ].
	self assert: index equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testBasicCollectEmpty [
	| res |
	res := self empty collect: [ :each | each class ].
	self assertEmpty: res
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testBasicCollectThenDo [

	| result index |
	index := 0.
	result := self collectionWithoutNilElements
		collect: [ :each | nil ]
		thenDo: [ :each |
			self assert: each isNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: index equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testCollectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testCollectThenDoOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testCollectThenSelectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenSelect: [ :e | self fail ])
]

{ #category : #'tests - copy - clone' }
SinglyLinkedListTest >> testCopyCreatesNewObject [

	| copy |
	copy := self nonEmpty copy.
	self deny: self nonEmpty identicalTo: copy
]

{ #category : #'tests - copy - clone' }
SinglyLinkedListTest >> testCopyEmpty [
	self assertEmpty: self empty copy
]

{ #category : #'tests - copy - clone' }
SinglyLinkedListTest >> testCopyNonEmpty [

	| copy |
	copy := self nonEmpty copy.
	self denyEmpty: copy.
	self assert: copy size equals: self nonEmpty size.
	self nonEmpty do: [ :each | copy includes: each ]
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDetect [

	| res element |
	element := self collectionWithoutNilElements anyOne.

	res := self collectionWithoutNilElements detect: [ :each |
		       each = element ].
	self assert: res equals: element
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenNobodyIsFound [
	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ true ] ifNone: [ false ].
	self deny: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFound [
	| wasFound foundObject |
	foundObject := nil.
	wasFound := self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element |
			foundObject := element.
			true ]
		ifNone: [ false ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ true ] ifNone: [ false ].
	self assert: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenNobodyIsFound [
	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ wasFound := true ].
	self deny: wasFound
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenSomethingIsFound [
	| wasFound foundObject |
	wasFound := false.
	foundObject := nil.
	self collectionWithoutNilElements
		detect: [ :each | each notNil ]
		ifFound: [ :element |
			foundObject := element.
			wasFound := true ].
	self
		assert: wasFound;
		assert: (self collectionWithoutNilElements includes: foundObject)
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ wasFound := true ].
	self assert: wasFound
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDetectIfNone [

	| res element |
	res := self collectionWithoutNilElements
		       detect: [ :each | each notNil not ]
		       ifNone: [ 100 ].
	self assert: res equals: 100.

	element := self collectionWithoutNilElements anyOne.
	res := self collectionWithoutNilElements
		       detect: [ :each | each = element ]
		       ifNone: [ 100 ].
	self assert: res equals: element
]

{ #category : #'test - iterate' }
SinglyLinkedListTest >> testDetectWhenNobodyIsFound [
	self should: [ self collectionWithoutNilElements detect: [ :each | each isNil ] ] raise: Error
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDo2 [

	"dc: Bad test, it assumes that a new instance of #speciesClass allows addition with #add:. This is not the case of Interval for which species is Array."

	"res := self speciesClass new.
	self collection do: [:each | res add: each class].
	self assert: res = self result. "

	| collection cptElementsViewed cptElementsIn |
	collection := self collectionWithoutNilElements.
	cptElementsViewed := 0.
	cptElementsIn := OrderedCollection new.
	collection do: [ :each |
		cptElementsViewed := cptElementsViewed + 1.
		" #do doesn't iterate with the same objects than those in the collection for FloatArray( I don' t know why ) . That's why I use #includes: and not #identityIncludes:  '"
		(collection includes: each) ifTrue: [ " the collection used doesn't include equal elements. Therefore each element viewed should not have been viewed before "
			(cptElementsIn includes: each) ifFalse: [ cptElementsIn add: each ] ] ].
	self assert: cptElementsViewed equals: collection size.
	self assert: cptElementsIn size equals: collection size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDoSeparatedBy [

	| actualString beforeFirst expectedString |
	actualString := String streamContents: [ :stream |
		                self collectionWithoutNilElements
			                do: [ :each | stream nextPutAll: each asString ]
			                separatedBy: [ stream nextPutAll: '|' ] ].

	beforeFirst := true.
	expectedString := String streamContents: [ :stream |
		                  self collectionWithoutNilElements do: [ :each |
			                  beforeFirst
				                  ifTrue: [ beforeFirst := false ]
				                  ifFalse: [ stream nextPutAll: '|' ].
			                  stream nextPutAll: each asString ] ].
	self assert: expectedString equals: actualString
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testDoWithout [

	| res element collection |
	collection := self collectionWithoutNilElements.
	res := OrderedCollection new.
	element := self collectionWithoutNilElements anyOne.
	collection do: [ :each | res add: each ] without: element.
	" verifying result :"
	self
		assert: res size
		equals: collection size - (collection occurrencesOf: element).
	res do: [ :each |
		self
			assert: (collection occurrencesOf: each)
			equals: (res occurrencesOf: each) ]
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual01 [

	| one another |
	one := SinglyLinkedList with: 1.
	another := SinglyLinkedList with: 1.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual02 [

	| one another |
	one := SinglyLinkedList new.
	another := SinglyLinkedList new.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual03 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2 with: 3.

	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual04 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 3 with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual05 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2 with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual06 [

	| one another |
	one := SinglyLinkedList with: 2 with: 3.
	another := SinglyLinkedList with: 2.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testEqual07 [

	| one another |
	one := SinglyLinkedList with: 2.
	another := SinglyLinkedList with: 2 with: 3.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
SinglyLinkedListTest >> testFirst01 [
	self
		should: [ self empty first ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testFirst02 [
	self assert: self nonEmpty first equals: 1.2
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIfEmpty [
	self nonEmpty ifEmpty: [ self assert: false ].
	self empty ifEmpty: [ self assert: true ]
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIfEmptyifNotEmpty [
	self assert: (self empty ifEmpty: [ true ] ifNotEmpty: [ false ]).
	self assert: (self nonEmpty ifEmpty: [ false ] ifNotEmpty: [ true ])
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIfNotEmpty [

	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIfNotEmptyifEmpty [
	self assert: (self empty ifNotEmpty: [ false ] ifEmpty: [ true ]).
	self assert: (self nonEmpty ifNotEmpty: [ true ] ifEmpty: [ false ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testInjectInto [

	| result |
	result := self collectionWithoutNilElements
		          inject: 0
		          into: [ :inj :ele | ele ifNotNil: [ inj + 1 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIsEmpty [
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testIsEmptyOrNil [
	self assert: self empty isEmptyOrNil.
	self deny: self nonEmpty isEmptyOrNil
]

{ #category : #tests }
SinglyLinkedListTest >> testLast01 [
	self
		should: [ self empty last ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testLast02 [
	self assert: self nonEmpty last equals: false
]

{ #category : #tests }
SinglyLinkedListTest >> testLast03 [
	| newList |
	newList := self empty.
	newList addAll: (1 to: 11).
	self assert: newList last equals: 11
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testNoneSatisfy [

	| element |
	self assert:
		(self collectionWithoutNilElements noneSatisfy: [ :each |
			 each notNil not ]).
	element := self collectionWithoutNilElements anyOne.
	self deny: (self collectionWithoutNilElements noneSatisfy: [ :each |
			 each ~= element ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testNoneSatisfyEmpty [

	self assert: ( self empty noneSatisfy: [:each | false])
]

{ #category : #'tests - empty' }
SinglyLinkedListTest >> testNotEmpty [
	self assert: self nonEmpty notEmpty.
	self deny: self empty notEmpty
]

{ #category : #'tests - printing' }
SinglyLinkedListTest >> testPrintElementsOn [

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
SinglyLinkedListTest >> testPrintNameOn [

	| printed |
	printed := String streamContents: [ :s | self nonEmpty printNameOn: s ].

	self
		assert: printed
		equals: (self nonEmpty class name first isVowel ifTrue: [ 'an ' ] ifFalse: [ 'a ' ]) , self nonEmpty class name
]

{ #category : #'tests - printing' }
SinglyLinkedListTest >> testPrintOn [

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
SinglyLinkedListTest >> testPrintOnDelimiter [

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
SinglyLinkedListTest >> testPrintOnDelimiterLast [

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

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testReject [

	| res element |
	res := self collectionWithoutNilElements reject: [ :each |
		       each notNil not ].
	self assert: res size equals: self collectionWithoutNilElements size.

	element := self collectionWithoutNilElements anyOne.
	res := self collectionWithoutNilElements reject: [ :each |
		       each = element ].
	self
		assert: res size
		equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectAllThenCollect [
	| result |
	result := self collectionWithoutNilElements reject: [ :each | each notNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectAllThenDo [
	| result |

	result := self collectionWithoutNilElements
		reject: [ :each | each notNil ]
		thenDo: [ :each | self fail ].

	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectEmpty [

	| res |
	res := self empty reject: [ :each | each odd ].
	self assert: res size equals: self empty size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectNoReject [

	| res |
	res := self collectionWithoutNilElements reject: [ :each |
		       each notNil not ].
	self assert: res size equals: self collectionWithoutNilElements size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectThenCollect [

	| result index selectIndex pivot |

	index := 0.
	selectIndex := 0.
	pivot := self collectionWithoutNilElements anyOne.

	result := self collectionWithoutNilElements
		reject: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex = 1 ]
		thenCollect: [ :each |
			self assert: each notNil.
			index := index + 1.
			pivot ].

	self assert: result ~= self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1.

	self assert: (self collectionWithoutNilElements occurrencesOf: pivot) equals: 1.
	"should be > 1 for standard collection and = 1 for those that do not allow exact duplicates"
	self assert: (result occurrencesOf: pivot) >= 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectThenCollectEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenCollect: [ :each | self fail ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectThenDo [

	| result index rejectIndex |

	index := 0.
	rejectIndex := 0.

	result := self collectionWithoutNilElements
		reject: [ :each |
			rejectIndex := rejectIndex + 1.
			"reject the first element"
			rejectIndex = 1 ]
		thenDo: [ :each |
			self assert: each notNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: rejectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testRejectThenDoOnEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond01 [
	| newList |
	newList := self empty.
	newList add: 1.
	self
		should: [ newList second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond02 [
	self
		should: [ self empty second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]
]

{ #category : #tests }
SinglyLinkedListTest >> testSecond03 [
	self assert: list second equals: -2
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelect [

	| result element |
	result := self collectionWithoutNilElements select: [ :each |
		          each notNil ].
	self
		assert: result size
		equals: self collectionWithoutNilElements size.

	element := self collectionWithoutNilElements anyOne.
	result := self collectionWithoutNilElements select: [ :each |
		          each ~= element ].
	self
		assert: result size
		equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectNoneThenCollect [
	| result |
	result := self collectionWithoutNilElements select: [ :each | each isNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectNoneThenDo [
	| result |

	result := self collectionWithoutNilElements
		select: [ :each | each isNil ]
		thenDo: [ self fail ].

	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectThenCollect [

	| result index selectIndex pivot |

	index := 0.
	selectIndex := 0.
	pivot := self collectionWithoutNilElements anyOne.

	result := self collectionWithoutNilElements
		select: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex > 1 ]
		thenCollect: [ :each |
			self assert: each notNil.
			index := index + 1.
			pivot ].

	self assert: result ~= self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1.

	self assert: (self collectionWithoutNilElements occurrencesOf: pivot) equals: 1.
	"should be > 1 for standard collection and = 1 for those that do not allow exact duplicates"
	self assert: (result occurrencesOf: pivot) >= 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectThenCollectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenCollect: [ self fail ])
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectThenDo [

	| result index selectIndex |

	index := 0.
	selectIndex := 0.

	result := self collectionWithoutNilElements
		select: [ :each |
			selectIndex := selectIndex + 1.
			"reject the first element"
			selectIndex > 1 ]
		thenDo: [ :each |
			self assert: each notNil.
			index := index + 1]	.

	self assert: result equals: self collectionWithoutNilElements.
	self assert: selectIndex equals: self collectionWithoutNilElements size.
	self assert: index equals: self collectionWithoutNilElements size - 1
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSelectThenDoOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - size capacity' }
SinglyLinkedListTest >> testSize [

	| size |
	self assert: self empty size equals: 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1 ].
	self assert: self sizeCollection size equals: size
]

{ #category : #'tests - iterating' }
SinglyLinkedListTest >> testSumNumbers [

	| result |
	result := self collectionWithoutNilElements sumNumbers: [ :each | each ifNotNil: [ 1 ] ifNil: [ 0 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAdd [

	| added collection |
	collection := self otherCollection.
	added := collection add: self element.
	self assert: added identicalTo: self element.
	self assert: (collection includes: self element).
	self assert: (self collectionWithElement includes: self element)
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAddAll [

	| added collection toBeAdded |
	collection := self collectionWithElement.
	toBeAdded := self otherCollection.
	added := collection addAll: toBeAdded.
	self assert: added identicalTo: toBeAdded.
	self assert: (collection includesAll: toBeAdded)
]

{ #category : #'tests - adding' }
SinglyLinkedListTest >> testTAddTwice [

	| added oldSize collection anElement |
	collection := self collectionWithElement.
	anElement := self element.
	oldSize := collection size.
	added := collection
		         add: anElement;
		         add: anElement.
	self assert: added identicalTo: anElement.
	self assert: (collection includes: anElement).
	self assert: collection size equals: oldSize + 2
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWith [

	| aCol anElement |
	anElement := self collectionMoreThan5Elements anyOne.
	aCol := self collectionClass with: anElement.
	self assert: (aCol includes: anElement)
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWithAll [

	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection.
	aCol := self collectionClass withAll: collection.

	collection do: [ :each | self assert: (aCol occurrencesOf: each ) equals: ( collection occurrencesOf: each ) ].

	self assert: aCol size equals: collection size
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWithWith [

	| aCol collection element1 element2 |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 2.
	element1 := collection at: 1.
	element2 := collection at: 2.

	aCol := self collectionClass with: element1  with: element2 .
	self assert: (aCol occurrencesOf: element1 ) equals: (collection occurrencesOf: element1).
	self assert: (aCol occurrencesOf: element2 ) equals: (collection occurrencesOf: element2)
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWithWithWith [

	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom:1 to: 3 .
	aCol := self collectionClass
						with: (collection at: 1)
						with: (collection at: 2)
						with: (collection at: 3).

	1 to: 3 do: [ :i |
		self assert: (aCol occurrencesOf: (collection at: i)) equals: (collection occurrencesOf: (collection at: i)) ]
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWithWithWithWith [

	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 4.
	aCol := self collectionClass with: (collection at:1) with: (collection at:2) with: (collection at: 3) with: (collection at: 4).

	1 to: 3 do: [ :i | self assert: (aCol occurrencesOf: (collection at: i)) equals: (collection occurrencesOf: (collection at: i)) ]
]

{ #category : #'tests - creation' }
SinglyLinkedListTest >> testWithWithWithWithWith [

	| aCol collection |
	collection := self collectionMoreThan5Elements asOrderedCollection copyFrom: 1 to: 5.
	aCol := self collectionClass
						with: (collection at: 1)
						with: (collection at: 2)
						with: (collection at: 3)
						with: (collection at: 4)
						with: (collection at: 5).

	1 to: 3 do: [ :i | self assert: (aCol occurrencesOf: (collection at: i)) equals: (collection occurrencesOf: (collection at: i)) ]
]
