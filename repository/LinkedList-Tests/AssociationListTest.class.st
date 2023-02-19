Class {
	#name : #AssociationListTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'alist',
		'valueNotIn',
		'keyNotIn',
		'associationNotIn',
		'nonEmpty5ElementsNoDuplicates',
		'emptyList',
		'notIncludedList',
		'nonEmpty1Element',
		'collectionIncluded',
		'collectionNotIncluded',
		'nonEmptyWithString'
	],
	#category : #'LinkedList-Tests-Dictionaries'
}

{ #category : #requirements }
AssociationListTest >> aValue [
	" return a value to put into nonEmpty"

	^ 33
]

{ #category : #requirements }
AssociationListTest >> anIndex [
	" return an index in nonEmpty bounds"

	^ #GG
]

{ #category : #requirements }
AssociationListTest >> anotherElementNotIn [
	" return an element different of 'elementNotIn'  not included in 'nonEmpty' "

	^ 937
]

{ #category : #requirements }
AssociationListTest >> anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "

	^ self collection associations anyOne
]

{ #category : #requirements }
AssociationListTest >> anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary) not present in 'collection' "

	^ associationNotIn
]

{ #category : #requirements }
AssociationListTest >> anotherValue [
	" return a value ( not eual to 'aValue' ) to put into nonEmpty "

	^ 67
]

{ #category : #asserting }
AssociationListTest >> assertNoDuplicates: aCollection whenConvertedTo: aClass [

	| result |
	result := self collectionWithEqualElements asIdentitySet.
	self assert: (result class includesBehavior: IdentitySet).
	self collectionWithEqualElements do: [ :initial | self assert: (result occurrencesOf: initial) equals: 1 ]
]

{ #category : #asserting }
AssociationListTest >> assertNonDuplicatedContents: aCollection whenConvertedTo: aClass [

	| result |
	result := aCollection perform: ('as' , aClass name) asSymbol.
	self assert: (result class includesBehavior: aClass).
	result do: 
		[ :each | 
		self assert: (aCollection occurrencesOf: each) equals: (result occurrencesOf: each) ].
	^ result
]

{ #category : #asserting }
AssociationListTest >> assertSameContents: aCollection whenConvertedTo: aClass [

	| result |
	result := self assertNonDuplicatedContents: aCollection whenConvertedTo: aClass.
	self assert: result size equals: aCollection size
]

{ #category : #requirements }
AssociationListTest >> associationWithKeyAlreadyInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is already included in nonEmptyDict)"

	^ #c -> valueNotIn
]

{ #category : #requirements }
AssociationListTest >> associationWithKeyNotInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is not included in nonEmptyDict)"
	^ associationNotIn 
]

{ #category : #coverage }
AssociationListTest >> classToBeTested [
	^ AssociationList
]

{ #category : #requirements }
AssociationListTest >> collection [
	^ self nonEmptyDict
]

{ #category : #requirements }
AssociationListTest >> collectionClass [
	" return the class to be used to create instances of the class tested"

	^ self classToBeTested
]

{ #category : #requirements }
AssociationListTest >> collectionNotIncluded [
	" return a collection for wich each element is not included in 'nonEmpty' "

	^ collectionNotIncluded
]

{ #category : #requirements }
AssociationListTest >> collectionWithElementsToRemove [
	" return a collection of elements included in 'nonEmpty'  "

	^ collectionIncluded
]

{ #category : #requirements }
AssociationListTest >> collectionWithSortableElements [
	" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"

	^ nonEmpty5ElementsNoDuplicates
]

{ #category : #requirements }
AssociationListTest >> collectionWithoutEqualElements [
	" return a collection without equal elements"

	^ nonEmpty5ElementsNoDuplicates
]

{ #category : #requirements }
AssociationListTest >> collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"

	^ nonEmpty5ElementsNoDuplicates
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> containsAll: union of: one andOf: another [
			
	self assert: (one allSatisfy: [:each | union includes: each]).
	self assert: (another allSatisfy: [:each | union includes: each])
]

{ #category : #requirements }
AssociationListTest >> doWithoutNumber [

	^ 2
]

{ #category : #requirements }
AssociationListTest >> element [
	^ 3
]

{ #category : #requirements }
AssociationListTest >> elementNotIn [
	"return an element not included in 'nonEmpty' "

	^ 739
]

{ #category : #requirements }
AssociationListTest >> elementNotInForOccurrences [
	" return an element notIncluded in #collectionWithoutEqualElements"

	^ valueNotIn
]

{ #category : #requirements }
AssociationListTest >> elementToAdd [
	" return an element of type 'nonEmpy' elements'type'  not  yet included in nonEmpty"

	^ #u -> 5
]

{ #category : #requirements }
AssociationListTest >> elementTwiceIn [
	^ 1 "12332312322"
]

{ #category : #requirements }
AssociationListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
AssociationListTest >> emptyDict [
	^ emptyList
]

{ #category : #requirements }
AssociationListTest >> expectedElementByDetect [

	^ -2
]

{ #category : #requirements }
AssociationListTest >> integerCollectionWithoutEqualElements [
	" return a collection of integer without equal elements"

	^ nonEmpty5ElementsNoDuplicates
]

{ #category : #requirements }
AssociationListTest >> keyNotIn [
	" return a key not included in nonEmpty"

	^ keyNotIn
]

{ #category : #requirements }
AssociationListTest >> keyNotInNonEmpty [
	" return a key not included in nonEmpty"

	^ keyNotIn
]

{ #category : #requirements }
AssociationListTest >> keyNotInNonEmptyDict [
	" return a key not included in nonEmptyDict"

	^ keyNotIn
]

{ #category : #requirements }
AssociationListTest >> newEmptyDict [
	^ self emptyDict copy
]

{ #category : #requirements }
AssociationListTest >> nonEmpty [
	^ alist
]

{ #category : #requirements }
AssociationListTest >> nonEmpty1Element [
	" return a collection of size 1 including one element"

	^ nonEmpty1Element
]

{ #category : #requirements }
AssociationListTest >> nonEmptyDict [
	^ alist
]

{ #category : #requirements }
AssociationListTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ notIncludedList
]

{ #category : #requirements }
AssociationListTest >> nonEmptyWithCopyNonIdentical [
	" return a collection including elements for wich copy is not identical to the initial element ( this is not the cas of Integer )"

	^ nonEmptyWithString
]

{ #category : #requirements }
AssociationListTest >> nonEmptyWithoutEqualsValues [
	"return a dictionary that doesn't include equal values"

	^ nonEmpty5ElementsNoDuplicates
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> numberOfSimilarElementsInIntersection [

	^ self collection occurrencesOf: self anotherElementOrAssociationIn
]

{ #category : #running }
AssociationListTest >> setUp [
	super setUp.
	emptyList := self classToBeTested new.
	alist := self classToBeTested new.
	alist
		at: #a put: 1;
		at: #b put: 30;
		at: #c put: 1;
		at: #d put: -2.
	nonEmpty5ElementsNoDuplicates := self classToBeTested new
		at: #a put: 5;
		at: #b put: 4;
		at: #c put: 7;
		at: #d put: 6;
		at: #e put: 9;
		yourself.
	valueNotIn := 666.
	keyNotIn := #z.
	associationNotIn := keyNotIn -> valueNotIn.
	notIncludedList := self classToBeTested new
		add: associationNotIn;
		yourself.
	nonEmpty1Element := self classToBeTested new
		at: #a put: 5;
		yourself.
	collectionIncluded := {1}.
	collectionNotIncluded := {valueNotIn.
	valueNotIn}.
	nonEmptyWithString := self classToBeTested new
		add: #A -> 'foo';
		add: #b -> 'bar';
		yourself
]

{ #category : #requirements }
AssociationListTest >> sizeCollection [
	"Answers a collection not empty"
	^ alist
]

{ #category : #requirements }
AssociationListTest >> supportsNilKey [
	^ true
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0CopyTest [
	self empty.
	self assertEmpty: self empty.
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self collectionWithElementsToRemove.
	self denyEmpty: self collectionWithElementsToRemove.
	self collectionWithElementsToRemove do: [ :each | self assert: (self nonEmpty includes: each) ].
	self elementToAdd.
	self deny: (self nonEmpty includes: self elementToAdd).
	self collectionNotIncluded do: [ :each | self deny: (self nonEmpty includes: each) ]
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureAsStringCommaAndDelimiterTest [

	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty.
	self nonEmpty1Element.
	self assert: self nonEmpty1Element size equals: 1
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureCloneTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureConverAsSortedTest [
	self collectionWithSortableElements.
	self denyEmpty: self collectionWithSortableElements
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryAddingTest [
	self nonEmptyDict.
	self denyEmpty: self nonEmptyDict.
	self associationWithKeyNotInToAdd.
	self deny: (self nonEmptyDict keys includes: self associationWithKeyNotInToAdd key).
	self associationWithKeyAlreadyInToAdd.
	self assert: (self nonEmptyDict keys includes: self associationWithKeyAlreadyInToAdd key)
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryAssocitionAccess [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self keyNotIn.
	self deny: (self nonEmpty keys includes: self keyNotIn)
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryCopyingTest [
	| duplicateKey |
	self nonEmptyDict.
	self denyEmpty: self nonEmptyDict.
	self nonEmptyDifferentFromNonEmptyDict.
	self denyEmpty: self nonEmptyDifferentFromNonEmptyDict.
	duplicateKey := true.
	self nonEmptyDict keys detect: [ :key | self nonEmptyDifferentFromNonEmptyDict includes: key ] ifNone: [ duplicateKey := false ].
	self deny: duplicateKey
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryElementAccess [
	| in |
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self keyNotIn.
	in := true.
	self nonEmpty keys detect: [ :key | key = self keyNotIn ] ifNone: [ in := false ].
	self deny: in
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryEnumeratingTest [
	self nonEmptyDict.
	self denyEmpty: self nonEmptyDict
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryIncludes [
	| in |
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self valueNotInNonEmpty.
	in := false.
	self nonEmpty valuesDo: [ :assoc | assoc = self valueNotInNonEmpty ifTrue: [ in := true ] ].
	self deny: in.
	self keyNotInNonEmpty.
	in := false.
	self nonEmpty keysDo: [ :assoc | assoc = self keyNotInNonEmpty ifTrue: [ in := true ] ].
	self deny: in
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryIncludesIdentity [

	self nonEmptyWithCopyNonIdentical.
	self denyEmpty: self nonEmptyWithCopyNonIdentical.
	self nonEmptyWithCopyNonIdentical do: [ :each | 
		self deny: each identicalTo: each copy ]
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryKeyAccess [
	| collection equals |
	self nonEmptyWithoutEqualsValues.
	self denyEmpty: self nonEmptyWithoutEqualsValues.
	equals := true.
	collection := self nonEmptyWithoutEqualsValues values.
	collection detect: [ :each | (collection occurrencesOf: each) > 1 ] ifNone: [ equals := false ].
	self deny: equals.
	self valueNotIn.
	self deny: (self nonEmptyWithoutEqualsValues values includes: self valueNotIn)
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryKeysValuesAssociationsAccess [
	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureDictionaryRemovingTest [
	self nonEmptyDict.
	self denyEmpty: self nonEmptyDict.
	self keyNotInNonEmptyDict.
	self deny: (self nonEmptyDict keys includes: self keyNotInNonEmptyDict)
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureEmptyTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureIncludeTest [
	| anElementIn |
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self elementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self elementNotIn ] ifNone: [ anElementIn := false ].
	self deny: anElementIn.
	self anotherElementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self anotherElementNotIn ] ifNone: [ anElementIn := false ].
	self deny: anElementIn.
	self empty.
	self assertEmpty: self empty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureIterateTest [

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
AssociationListTest >> test0FixtureOccurrencesTest [
	| tmp |
	self empty.
	self assertEmpty: self empty.
	self collectionWithoutEqualElements.
	self denyEmpty: self collectionWithoutEqualElements.
	tmp := OrderedCollection new.
	self collectionWithoutEqualElements
		do: [ :each | 
			self deny: (tmp includes: each).
			tmp add: each ].
	self elementNotInForOccurrences.
	self deny: (self collectionWithoutEqualElements includes: self elementNotInForOccurrences)
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixturePrintTest [
	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixturePutTest [
	self aValue.
	self anotherValue.

	self anIndex.
	self nonEmpty isDictionary ifFalse: [ self assert: (self anIndex >= 1 & self anIndex) <= self nonEmpty size ].

	self empty.
	self assertEmpty: self empty.

	self nonEmpty.
	self denyEmpty: self nonEmpty
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureSetAritmeticTest [
	self collection.
	self denyEmpty: self collection.
	self nonEmpty.
	self denyEmpty: self nonEmpty.
	self anotherElementOrAssociationNotIn.
	self collection isDictionary
		ifTrue: [ self deny: (self collection associations includes: self anotherElementOrAssociationNotIn key) ]
		ifFalse: [ self deny: (self collection includes: self anotherElementOrAssociationNotIn) ].
	self collectionClass
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0FixtureTConvertTest [

	"A collection of number without equal elements:"

	| res |
	self collectionWithoutEqualElements.
	res := true.
	self collectionWithoutEqualElements
		detect: [ :each | 
			(self collectionWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res equals: false
]

{ #category : #'tests - fixture' }
AssociationListTest >> test0TSizeTest [
	self empty.
	self sizeCollection.
	self assertEmpty: self empty.
	self denyEmpty: self sizeCollection
]

{ #category : #'tests - adding' }
AssociationListTest >> testAddAll [

	| collectionToAdd collection result oldSize |
	collection := self nonEmptyDict.
	oldSize := collection size.
	collectionToAdd := self collectionClass new
		                   add: self associationWithKeyAlreadyInToAdd;
		                   add: self associationWithKeyNotInToAdd;
		                   yourself.

	result := collection addAll: collectionToAdd.
	self assert: result equals: collectionToAdd.
	self assert: collection size equals: oldSize + 1.

	result associationsDo: [ :assoc | 
		self assert: (collection at: assoc key) equals: assoc value ]
]

{ #category : #'tests - adding' }
AssociationListTest >> testAddWithKeyAlreadyIn [

	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyAlreadyInToAdd.
	result := dictionary add: association.
	self assert: result equals: association.
	self
		assert: (dictionary at: association key)
		equals: association value.
	self assert: dictionary size equals: oldSize
]

{ #category : #'tests - adding' }
AssociationListTest >> testAddWithKeyNotIn [
	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.

	self assert: result equals: association.
	self assert: (dictionary at: association key) equals: association value.
	self assert: dictionary size equals: oldSize + 1
]

{ #category : #'tests - iterating' }
AssociationListTest >> testAllSatisfy [

	| element |
	" when all element  satisfy the condition, should return true : "
	self assert: ( self collectionWithoutNilElements  allSatisfy: [:each | (each notNil) ] ).
	
	" when all element don't satisfy the condition, should return false : "
	self deny: ( self collectionWithoutNilElements  allSatisfy: [:each | (each notNil) not ] ).
	
	" when only one element doesn't satisfy the condition' should return false'"
	element := self collectionWithoutNilElements anyOne.
	self deny: ( self collectionWithoutNilElements  allSatisfy: [:each | (each = element) not] ).
]

{ #category : #'tests - iterating' }
AssociationListTest >> testAllSatisfyEmpty [

	self assert: ( self empty allSatisfy: [:each | false]).
]

{ #category : #'tests - iterating' }
AssociationListTest >> testAnySastify [

	| element |
	" when all elements satisty the condition, should return true :"
	self assert: ( self collectionWithoutNilElements anySatisfy: [:each | each notNil ]).
	
	" when only one element satisfy the condition, should return true :"
	element := self collectionWithoutNilElements anyOne.
	self assert: ( self collectionWithoutNilElements  anySatisfy: [:each | (each = element)  ]   ).
	
	" when all elements don't satisty the condition, should return false :"
	self deny: ( self collectionWithoutNilElements anySatisfy: [:each | (each notNil) not ]).
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsArray [

	self 
		assertSameContents: self collectionWithoutEqualElements
		whenConvertedTo: Array
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsBag [

	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: Bag
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsByteArray [

	| res |
	self integerCollectionWithoutEqualElements.
	self integerCollectionWithoutEqualElements do: [ :each | 
		self assert: each class equals: SmallInteger ].
	res := true.
	self integerCollectionWithoutEqualElements
		detect: [ :each | 
			(self integerCollectionWithoutEqualElements occurrencesOf: each)
			> 1 ]
		ifNone: [ res := false ].
	self assert: res equals: false.
	self
		assertSameContents: self integerCollectionWithoutEqualElements
		whenConvertedTo: ByteArray
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsCommaStringEmpty [

	self assert: self empty asCommaString equals: ''.
	self assert: self empty asCommaStringAnd equals: ''
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsCommaStringMore [

	| result resultAnd allElementsAsString tmp |
	result := self nonEmpty asCommaString.
	resultAnd := self nonEmpty asCommaStringAnd.
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	"verifying result  :"
	allElementsAsString := result findBetweenSubstrings: ', '.
	allElementsAsString do: [ :each | 
		self
			assert: (tmp occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each) ].

	"verifying esultAnd :"
	allElementsAsString := resultAnd findBetweenSubstrings: ', '.
	1 to: allElementsAsString size do: [ :i | 
		i < (allElementsAsString size - 1) | (i = allElementsAsString size) 
			ifTrue: [ 
				self
					assert: (tmp occurrencesOf: (allElementsAsString at: i))
					equals:
					(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ].
		i = (allElementsAsString size - 1) ifTrue: [ 
			self assert: (allElementsAsString at: i) equals: 'and' ] ]
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsCommaStringOne [

	self nonEmpty1Element do: [ :each | 
		self
			assert: each asString
			equals: self nonEmpty1Element asCommaString.
		self
			assert: each asString
			equals: self nonEmpty1Element asCommaStringAnd ]
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsIdentitySet [
	"Test with a collection without equal elements :"

	self 
		assertSameContents: self collectionWithoutEqualElements
		whenConvertedTo: IdentitySet
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsOrderedCollection [
	
	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: OrderedCollection
]

{ #category : #'tests - converting' }
AssociationListTest >> testAsSet [
 	"Test with a collection without equal elements"
	
	self assertSameContents: self collectionWithoutEqualElements whenConvertedTo: Set
]

{ #category : #'tests - as sorted collection' }
AssociationListTest >> testAsSortedArray [

	| result collection |
	collection := self collectionWithSortableElements.
	result := collection asArray sort.
	self assert: (result class includesBehavior: Array).
	self assert: result isSorted.
	self assert: result size equals: collection size
]

{ #category : #'tests - as sorted collection' }
AssociationListTest >> testAsSortedCollection [

	| aCollection result |
	aCollection := self collectionWithSortableElements.
	result := aCollection asSortedCollection.

	self assert: (result class includesBehavior: SortedCollection).
	result do: [ :each | 
		self
			assert: (aCollection occurrencesOf: each)
			equals: (result occurrencesOf: each) ].
	self assert: result size equals: aCollection size
]

{ #category : #'tests - as sorted collection' }
AssociationListTest >> testAsSortedCollectionWithSortBlock [

	| result tmp |
	result := self collectionWithSortableElements  asSortedCollection: [:a :b | a > b ].
	self assert: (result class includesBehavior: SortedCollection).
	result do: 
		[ :each | 
		self assert: (self collectionWithSortableElements occurrencesOf: each) equals: (result occurrencesOf: each) ].
	self assert: result size equals: self collectionWithSortableElements  size.
	tmp:=result at: 1.
	result do: [:each| self assert: tmp >= each. tmp := each ]
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' ]) equals: ''
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterLastEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' last: 'and' ]) equals: ''
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterLastMore [

	| delim multiItemStream result last allElementsAsString |
	delim := ', '.
	last := ' and '.
	result := ''.
	multiItemStream := ReadWriteStream on: result.
	self nonEmpty asStringOn: multiItemStream delimiter: delim last: last.
	result := multiItemStream contents.
	allElementsAsString := result findBetweenSubstrings: delim.
	self nonEmpty do: [ :each | 
		self
			assert: (self nonEmpty occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each asString) ].
	self
		assert: (allElementsAsString at: allElementsAsString size - 1)
		equals: 'and'
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterLastOne [

	| delim oneItemStream result |
	delim := ', '.
	result := ''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element
		asStringOn: oneItemStream
		delimiter: delim
		last: 'and'.
	oneItemStream do: [ :each1 | 
		self nonEmpty1Element do: [ :each2 | 
			self assert: each1 equals: each2 asString ] ]
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterMore [

	| delim multiItemStream result allElementsAsString |
	delim := ', '.
	result := ''.
	multiItemStream := ReadWriteStream on: result.
	self nonEmpty asStringOn: multiItemStream delimiter: delim.
	result := multiItemStream contents.
	allElementsAsString := result findBetweenSubstrings: delim.
	self nonEmpty do: [ :each | 
		self
			assert: (self nonEmpty occurrencesOf: each)
			equals: (allElementsAsString occurrencesOf: each asString) ]
]

{ #category : #'tests - as string comma delimiter sequenceable' }
AssociationListTest >> testAsStringOnDelimiterOne [

	| delim oneItemStream result |
	delim := ', '.
	result := ''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element asStringOn: oneItemStream delimiter: delim.
	oneItemStream do: [ :each1 | 
		self nonEmpty1Element do: [ :each2 | 
			self assert: each1 equals: each2 asString ] ]
]

{ #category : #'tests - dictionary assocition access' }
AssociationListTest >> testAssociationAt [
	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn.

	self assert: result key equals: keyIn.
	self assert: result value equals: (collection at: keyIn)
]

{ #category : #'tests - dictionary assocition access' }
AssociationListTest >> testAssociationAtError [

	| collection nonExistantKey |
	collection := self nonEmpty.
	nonExistantKey := self keyNotIn .

	self should: [collection associationAt: nonExistantKey] raise: Error.
]

{ #category : #'tests - dictionary assocition access' }
AssociationListTest >> testAssociationAtIfAbsent [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn ifAbsent: [ 888 ].
	self assert: result key equals: keyIn.
	self assert: result value equals: (collection at: keyIn).
	self
		assert: (collection associationAt: self keyNotIn ifAbsent: [ 888 ])
		equals: 888
]

{ #category : #'tests - dictionary assocition access' }
AssociationListTest >> testAssociationAtIfPresent [

	| collection keyIn result |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.

	result := collection associationAt: keyIn ifPresent: [ :assoc | 
		          { 
			          #present.
			          assoc } ].
	self
		assert: result isArray;
		assert: result size equals: 2;
		assert: result first equals: #present;
		assert: result second key equals: keyIn;
		assert: result second value equals: (collection at: keyIn).

	"test that cull: is used to support zero-arg blocks"
	result := collection associationAt: keyIn ifPresent: [ #present ].
	self assert: result equals: #present.

	result := collection
		          associationAt: self keyNotIn
		          ifPresent: [ :assoc | 
			          { 
				          #present.
				          assoc } ].
	self assert: result isNil
]

{ #category : #'tests - dictionary assocition access' }
AssociationListTest >> testAssociationAtIfPresentifAbsent [

	| collection keyIn found |
	found := false.
	collection := self nonEmpty.
	keyIn := collection keys anyOne.
	collection
		associationAt: keyIn
		ifPresent: [ found := true ]
		ifAbsent: [ 888 ].
	self assert: found.
	self
		assert: (collection associationAt: self keyNotIn ifAbsent: [ 888 ])
		equals: 888.
	self
		assert: (collection
				 associationAt: self keyNotIn
				 ifPresent: [ 666 ]
				 ifAbsent: [ 888 ])
		equals: 888
]

{ #category : #'tests - dictionary keys values associations access' }
AssociationListTest >> testAssociations [

	| collection result |
	collection := self nonEmpty.
	result := collection associations.
	self assert: result size equals: collection size.
	result do: [ :assoc | "keys do: [ :key | self assert: ( result at: key ) = ( collection at: key )] ." 
		self assert: assoc value equals: (collection at: assoc key) ]
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testAssociationsDo [

	| collection keys |
	collection := self nonEmptyDict.

	keys := OrderedCollection new.

	collection associationsDo: [ :assoc | 
		keys add: assoc key.
		self assert: (collection at: assoc key) equals: assoc value ].

	collection keys do: [ :key | 
		self
			assert: (keys occurrencesOf: key)
			equals: (collection keys occurrencesOf: key) ]
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testAssociationsSelect [

	| collection keys result |
	collection := self nonEmptyDict.
	keys := OrderedCollection new.
	result := collection associationsSelect: [ :assoc | 
		          keys add: assoc key.
		          true ].

	collection keys do: [ :key | 
		self
			assert: (collection keys occurrencesOf: key)
			equals: (keys occurrencesOf: key) ].
	self assert: result equals: collection
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAt [

	"self run: #testAt"

	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	self
		assert: (collection at: association key)
		equals: association value.
	self should: [ collection at: self keyNotIn ] raise: Error
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtIfAbsent [

	"self run: #testAtIfAbsent"

	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	self
		assert: (collection at: association key ifAbsent: [ Error signal ])
		equals: association value.
	self
		assert: (collection at: self keyNotIn ifAbsent: [ self valueNotIn ])
		equals: self valueNotIn
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtIfAbsentPut [

	"self run: #testAtIfAbsentPut"

	| collection association |
	collection := self nonEmpty.
	association := collection associations anyOne.
	self
		assert:
		(collection at: association key ifAbsentPut: [ Error signal ])
		equals: association value.
	self
		assert: (collection at: association key)
		equals: association value.
	self
		assert:
		(collection at: self keyNotIn ifAbsentPut: [ self valueNotIn ])
		equals: self valueNotIn.
	self assert: (collection at: self keyNotIn) equals: self valueNotIn
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtIfPresent [

	"self run: #testAtIfPresent"

	| collection association arg |
	collection := self nonEmpty.
	association := collection associations anyOne.
	arg := nil.
	self
		assert: (collection at: association key ifPresent: [ :value | 
				 arg := value.
				 #present ])
		equals: #present.
	self assert: arg equals: association value.
	self
		assert: (collection at: association key ifPresent: [ #present ])
		equals: #present.
	self assert:
		(collection at: self keyNotIn ifPresent: [ :value | Error signal ])
			isNil
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtIfPresentIfAbsent [

	"self run: #testAtIfPresentIfAbsent"

	| collection association arg |
	collection := self nonEmpty.
	association := collection associations anyOne.
	arg := nil.
	self
		assert: (collection
				 at: association key
				 ifPresent: [ :value | 
					 arg := value.
					 #present ]
				 ifAbsent: [ Error signal ])
		equals: #present.
	self assert: arg equals: association value.
	self
		assert: (collection
				 at: association key
				 ifPresent: [ #present ]
				 ifAbsent: [ Error signal ])
		equals: #present.
	self
		assert: (collection
				 at: self keyNotIn
				 ifPresent: [ :value | Error signal ]
				 ifAbsent: [ self valueNotIn ])
		equals: self valueNotIn
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtIfPresentIfAbsentPut [

	"self run: #testAtIfPresentIfAbsentPut"

	| collection association arg |
	collection := self nonEmpty.
	association := collection associations anyOne.
	arg := nil.
	self
		assert: (collection
				 at: association key
				 ifPresent: [ :value | 
					 arg := value.
					 #present ]
				 ifAbsentPut: [ Error signal ])
		equals: #present.
	self assert: arg equals: association value.
	self
		assert: (collection
				 at: association key
				 ifPresent: [ #present ]
				 ifAbsentPut: [ Error signal ])
		equals: #present.
	self
		assert: (collection
				 at: self keyNotIn
				 ifPresent: [ :value | Error signal ]
				 ifAbsentPut: [ self valueNotIn ])
		equals: self valueNotIn.
	self assert: (collection at: self keyNotIn) equals: self valueNotIn
]

{ #category : #'tests - at put' }
AssociationListTest >> testAtPut [

	self nonEmpty at: self anIndex put: self aValue.
	self assert: (self nonEmpty at: self anIndex) equals: self aValue
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtPutDict [

	"Do not rename to testAtPut, will conflict with TPutBasicTest>>#testAtPut"

	"self run: #testAtPutDict"

	| collection keyIn newValue |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.
	newValue := self valueNotIn.

	"use == to ensure the exact object argument to put: is stored and returned"
	self
		assert: (collection at: keyIn put: newValue)
		identicalTo: newValue.
	self assert: (collection at: keyIn) identicalTo: newValue.

	newValue := self valueNotIn -> self valueNotIn.
	self
		assert: (collection at: keyIn put: newValue)
		identicalTo: newValue.
	self assert: (collection at: keyIn) identicalTo: newValue.

	newValue := { 
		            self valueNotIn.
		            self valueNotIn.
		            self valueNotIn }.
	self
		assert: (collection at: self keyNotIn put: newValue)
		identicalTo: newValue.
	self assert: (collection at: self keyNotIn) identicalTo: newValue
]

{ #category : #'tests - DictionaryIndexAccessing' }
AssociationListTest >> testAtPutNil [

	"self run: #testAtPutNil"

	| collection keyIn newValue |
	collection := self nonEmpty.
	keyIn := collection keys anyOne.
	newValue := self valueNotIn.
	self assert: (collection at: nil put: newValue) identicalTo: newValue.
	self supportsNilKey
		ifTrue: [ self assert: (collection at: nil) identicalTo: newValue ]
		ifFalse: [ self deny: (collection includesKey: nil) ].
	self assert: (collection at: keyIn put: nil) isNil.
	self assert: (collection at: keyIn) isNil.
	self assert: (collection at: self keyNotIn put: nil) isNil.
	self assert: (collection at: self keyNotIn) isNil.
	self assert: (collection at: nil put: nil) isNil.
	self supportsNilKey
		ifTrue: [ self assert: (collection at: nil) isNil ]
		ifFalse: [ self deny: (collection includesKey: nil) ]
]

{ #category : #'tests - at put' }
AssociationListTest >> testAtPutTwoValues [

	self nonEmpty at: self anIndex put: self aValue.
	self nonEmpty at: self anIndex put: self anotherValue.
	self
		assert: (self nonEmpty at: self anIndex)
		equals: self anotherValue
]

{ #category : #'tests - iterating' }
AssociationListTest >> testBasicCollect [

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
AssociationListTest >> testBasicCollectEmpty [
	| res |
	res := self empty collect: [ :each | each class ].
	self assertEmpty: res
]

{ #category : #'tests - iterating' }
AssociationListTest >> testBasicCollectThenDo [

	| result index |
	index := 0.
	result := self collectionWithoutNilElements 
		collect: [ :each | nil ]
		thenDo: [ :each | 
			self assert: each isNil.
			index := index + 1]	.
			
	self assert: result equals: self collectionWithoutNilElements.
	self assert: index equals: self collectionWithoutNilElements size.
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testCollect [

	| collection values result |
	collection := self nonEmptyDict.
	values := OrderedCollection new.
	result := collection collect: [ :value | values add: value ].

	collection values do: [ :value | 
		self
			assert: (collection values occurrencesOf: value)
			equals: (values occurrencesOf: value) ].
	self assert: result equals: collection
]

{ #category : #'tests - iterating' }
AssociationListTest >> testCollectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
AssociationListTest >> testCollectThenDoOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - iterating' }
AssociationListTest >> testCollectThenSelectOnEmpty [
	self assertEmpty: (self empty collect: [ :e | self fail ] thenSelect: [ :e | self fail ])
]

{ #category : #'tests - copy - clone' }
AssociationListTest >> testCopyCreatesNewObject [

	| copy |
	copy := self nonEmpty copy.
	self deny: self nonEmpty identicalTo: copy
]

{ #category : #'tests - copy - clone' }
AssociationListTest >> testCopyEmpty [
	self assertEmpty: self empty copy
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyEmptyWith [

	| res anElement |
	anElement := self elementToAdd.
	res := self empty copyWith: anElement.
	self assert: res size equals: (self empty size + 1).
	self assert: (res includes: (anElement value))
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyEmptyWithoutAll [

	| res |
	res := self empty copyWithoutAll: self collectionWithElementsToRemove.
	self assert: res size equals: self empty size.
	self collectionWithElementsToRemove do: [ :each | self deny: (res includes: each) ]
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyEquals [
	"A copy should be equivalent to the things it's a copy of."
	
	| copy | 
	copy := self nonEmpty copy.
	self assert: copy equals: self nonEmpty
]

{ #category : #'tests - copy - clone' }
AssociationListTest >> testCopyNonEmpty [

	| copy |
	copy := self nonEmpty copy.
	self denyEmpty: copy.
	self assert: copy size equals: self nonEmpty size.
	self nonEmpty do: [ :each | copy includes: each ]
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyNonEmptyWith [

	| res anElement |
	anElement := self elementToAdd .
	res := self nonEmpty copyWith: anElement.
	"Here we do not test the size since for a non empty set we would get a problem.
	Then in addition copy is not about duplicate management. The element should 
	be in at the end."
	self assert: (res includes: (anElement value)).
	self nonEmpty do: [ :each | res includes: each ]
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyNonEmptyWithoutAll [

	| res |
	res := self nonEmpty copyWithoutAll: self collectionWithElementsToRemove.
	"here we do not test the size since for a non empty set we would get a problem.
	Then in addition copy is not about duplicate management. The element should 
	be in at the end."
	self collectionWithElementsToRemove do: [ :each | self deny: (res includes: (each)) ].
	self nonEmpty do: 
		[ :each | 
		(self collectionWithElementsToRemove includes: each) ifFalse: [ self assert: (res includes: each) ] ]
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyNonEmptyWithoutAllNotIncluded [

	| res |
	res := self nonEmpty copyWithoutAll: self collectionNotIncluded.
	"here we do not test the size since for a non empty set we would get a problem.
	Then in addition copy is not about duplicate management. The element should 
	be in at the end."
	self nonEmpty do: [ :each | self assert: (res includes: each) ]
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopyNotSame [

	"A copy of a collection should always be of the same class as the instance it copies"

	| copy |
	copy := self nonEmpty copy.
	self deny: copy identicalTo: self nonEmpty
]

{ #category : #'tests - copy' }
AssociationListTest >> testCopySameClass [

	"A copy of a collection should always be of the same class as the instance it copies"

	| copy |
	copy := self empty copy.
	self assert: copy class identicalTo: self empty class
]

{ #category : #'tests - adding' }
AssociationListTest >> testDeclareFrom [
	| newDict v dictionary keyIn associationKeyNotIn |
	dictionary := self nonEmptyDict.
	keyIn := dictionary keys anyOne.
	associationKeyNotIn := self associationWithKeyNotInToAdd.
	newDict := self collectionClass new
		add: associationKeyNotIn;
		yourself.

	"if the key already exist, nothing changes"
	v := dictionary at: keyIn.
	dictionary declare: keyIn from: newDict.
	self assert: (dictionary at: keyIn) equals: v.

	"if the key does not exist, then it gets removed from newDict and is added to the receiver"
	self nonEmptyDict declare: associationKeyNotIn key from: newDict.
	self assert: (dictionary at: associationKeyNotIn key) equals: associationKeyNotIn value.
	self assert: newDict size equals: 0
]

{ #category : #'tests - iterating' }
AssociationListTest >> testDetect [

	| res element |
	element := self collectionWithoutNilElements anyOne.

	res := self collectionWithoutNilElements detect: [ :each | 
		       each = element ].
	self assert: res equals: element
]

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundIfNoneWhenNobodyIsFound [
	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ true ] ifNone: [ false ].
	self deny: wasFound
]

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundIfNoneWhenSomethingIsFound [
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

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundIfNoneWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ true ] ifNone: [ false ].
	self assert: wasFound
]

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundWhenNobodyIsFound [
	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each isNil ] ifFound: [ wasFound := true ].
	self deny: wasFound
]

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundWhenSomethingIsFound [
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

{ #category : #'tests - iterate' }
AssociationListTest >> testDetectIfFoundWhenSomethingIsFoundIgnoringTheFoundObject [
	"The foundBlock can be a zero argument block ignoring the object found"

	| wasFound |
	wasFound := false.
	self collectionWithoutNilElements detect: [ :each | each notNil ] ifFound: [ wasFound := true ].
	self assert: wasFound
]

{ #category : #'tests - iterating' }
AssociationListTest >> testDetectIfNone [

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

{ #category : #'tests - copying' }
AssociationListTest >> testDictionaryConcatenationWithCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary2 size.

	dictionary2 associationsDo: [ :assoc | 
		self assert: (result at: assoc key) equals: assoc value ]
]

{ #category : #'tests - copying' }
AssociationListTest >> testDictionaryConcatenationWithCommonKeysDifferentValues [

	| dictionary1 dictionary2 result value |
	dictionary1 := self nonEmptyDict.
	value := self nonEmptyDifferentFromNonEmptyDict values anyOne.
	dictionary2 := dictionary1 copy.
	dictionary2 keys do: [ :key | dictionary2 at: key put: value ].


	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary2 size.

	dictionary2 associationsDo: [ :assoc | 
		self assert: (result at: assoc key) equals: assoc value ]
]

{ #category : #'tests - copying' }
AssociationListTest >> testDictionaryConcatenationWithoutCommonKeys [

	| dictionary1 dictionary2 result |
	dictionary1 := self nonEmptyDict.
	dictionary2 := self nonEmptyDifferentFromNonEmptyDict.
	result := dictionary1 , dictionary2.
	self assert: result size equals: dictionary1 size + dictionary2 size.
	dictionary1 associationsDo: [ :assoc | 
		self assert: (result at: assoc key) equals: assoc value ].
	dictionary2 associationsDo: [ :assoc | 
		self assert: (result at: assoc key) equals: assoc value ]
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testDifference [

	"Answer the set theoretic difference of two collections."

	| difference |
	self assertEmpty: (self collectionWithoutEqualElements difference:
			 self collectionWithoutEqualElements).
	self assertEmpty:
		(self empty difference: self collectionWithoutEqualElements).
	difference := self collectionWithoutEqualElements difference:
		              self empty.
	self
		assert: difference size
		equals: self collectionWithoutEqualElements size.
	self collectionWithoutEqualElements do: [ :each | 
		self assert: (difference includes: each) ]
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testDifferenceWithNonNullIntersection [
	"Answer the set theoretic difference of two collections. 
	 	#(1 2 3) difference: #(2 4) ->  #(1 3)"
	
	| res overlapping |
	overlapping := self collectionClass 
		with: self anotherElementOrAssociationNotIn
		with: self anotherElementOrAssociationIn.
	res := self collection difference: overlapping.
	self deny: (res includes: self anotherElementOrAssociationIn).
	overlapping do: [ :each | self deny: (res includes: each) ]
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testDifferenceWithSeparateCollection [
	"Answer the set theoretic difference of two collections."

	| res separateCol |	
	separateCol := self collectionClass with: self anotherElementOrAssociationNotIn.
	res := self collectionWithoutEqualElements difference: separateCol.
	
	self deny: (res includes: self anotherElementOrAssociationNotIn).
	self assert: res size equals: self collectionWithoutEqualElements size.
	
	self collectionWithoutEqualElements do: [ :each|
		self assert: (res includes: each)].
	
	res := separateCol difference: self collection.
	self deny: (res includes: self collection anyOne).
	self assert: res equals: separateCol
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testDo [

	| t collection |
	collection := self nonEmptyDict.
	t := OrderedCollection new.
	collection do: [ :value | t add: value ].

	t do: [ :each | 
		self
			assert: (t occurrencesOf: each)
			equals: (collection values occurrencesOf: each) ]
]

{ #category : #'tests - iterating' }
AssociationListTest >> testDo2 [

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
AssociationListTest >> testDoSeparatedBy [

	| string expectedString beforeFirst |
	string := ''.
	self collectionWithoutNilElements
		do: [ :each | string := string , each asString ]
		separatedBy: [ string := string , '|' ].

	expectedString := ''.
	beforeFirst := true.
	self collectionWithoutNilElements do: [ :each | 
		beforeFirst
			ifTrue: [ beforeFirst := false ]
			ifFalse: [ expectedString := expectedString , '|' ].
		expectedString := expectedString , each asString ].
	self assert: expectedString equals: string
]

{ #category : #'tests - iterating' }
AssociationListTest >> testDoWithout [

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

{ #category : #'tests - comparing' }
AssociationListTest >> testEquality [

	| nonEmptyDict2 |
	nonEmptyDict2 := self nonEmpty class new.
	self nonEmpty keysAndValuesDo: [ :key :value | 
		nonEmptyDict2 at: key put: value ].
	self assert: self nonEmptyDict equals: nonEmptyDict2
]

{ #category : #'tests - includes' }
AssociationListTest >> testIdentityIncludesNonSpecificComportement [
	"Test the same comportement than #includes:"
	
	| collection |	
	collection := self nonEmpty.
	
	self deny: (collection identityIncludes: self elementNotIn).
	self assert: (collection identityIncludes: collection anyOne)
]

{ #category : #'tests - empty' }
AssociationListTest >> testIfEmpty [
	self nonEmpty ifEmpty: [ self assert: false ].
	self empty ifEmpty: [ self assert: true ]
]

{ #category : #'tests - empty' }
AssociationListTest >> testIfEmptyifNotEmpty [
	self assert: (self empty ifEmpty: [ true ] ifNotEmpty: [ false ]).
	self assert: (self nonEmpty ifEmpty: [ false ] ifNotEmpty: [ true ])
]

{ #category : #'tests - empty' }
AssociationListTest >> testIfNotEmpty [

	self empty ifNotEmpty: [ self assert: false ].
	self nonEmpty ifNotEmpty: [ self assert: true ].
	self
		assert: (self nonEmpty ifNotEmpty: [ :s | s ])
		equals: self nonEmpty
]

{ #category : #'tests - empty' }
AssociationListTest >> testIfNotEmptyifEmpty [
	self assert: (self empty ifNotEmpty: [ false ] ifEmpty: [ true ]).
	self assert: (self nonEmpty ifNotEmpty: [ true ] ifEmpty: [ false ])
]

{ #category : #'tests - includes' }
AssociationListTest >> testIncludesAllNoneThere [

	self deny: (self empty includesAll: self nonEmpty ).
	self deny: (self nonEmpty includesAll: { self elementNotIn. self anotherElementNotIn })
]

{ #category : #'tests - includes' }
AssociationListTest >> testIncludesAnyAllThere [

	self deny: (self nonEmpty includesAny: self empty).
	self assert: (self nonEmpty includesAny: { self nonEmpty anyOne }).
	self assert: (self nonEmpty includesAny: self nonEmpty).
]

{ #category : #'tests - includes' }
AssociationListTest >> testIncludesAnyNoneThere [
	
	self deny: (self nonEmpty includesAny: self empty).
	self deny: (self nonEmpty includesAny: { self elementNotIn. self anotherElementNotIn })
]

{ #category : #'tests - dictionary including' }
AssociationListTest >> testIncludesAssociation [

	|  nonExistantAssociation associationIn keyIn valueIn |

	keyIn := self nonEmpty keys anyOne.
	valueIn := self nonEmpty values anyOne. 
	nonExistantAssociation := self keyNotInNonEmpty -> self valueNotInNonEmpty .
	associationIn := self nonEmpty associations anyOne.	

	self assert:  (self nonEmpty includesAssociation: associationIn ).
	self deny:  (self nonEmpty includesAssociation: nonExistantAssociation ).
	" testing the case where key is included but not with the same value :"
	self deny: (self nonEmpty includesAssociation: (keyIn-> self valueNotInNonEmpty )).
	" testing the case where value is included but not corresponding key :"
	self deny: (self nonEmpty includesAssociation: (self keyNotInNonEmpty -> valueIn  )).
]

{ #category : #'tests - dictionary including' }
AssociationListTest >> testIncludesComportementForDictionnary [
	| valueIn collection keyIn |
	collection := self nonEmpty.
	valueIn := collection values anyOne.
	keyIn := collection keys anyOne.
	self assert: (collection includes: valueIn).
	self deny: (collection includes: self valueNotInNonEmpty).
	" testing that includes take only care of values :"
	self deny: (collection includes: keyIn)
]

{ #category : #'tests - includes' }
AssociationListTest >> testIncludesElementIsNotThere [
	
	self deny: (self nonEmpty includes: self elementNotIn).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotIn)
]

{ #category : #'tests - includes' }
AssociationListTest >> testIncludesElementIsThere [
	
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
]

{ #category : #'tests - dictionary including' }
AssociationListTest >> testIncludesIdentityBasicComportement [

| valueIn collection |
collection := self nonEmpty .
valueIn := collection  values anyOne.

self assert: (collection includesIdentity: valueIn ) .
self deny: (collection includesIdentity: self valueNotInNonEmpty ).
]

{ #category : #'tests - dictionary including' }
AssociationListTest >> testIncludesIdentitySpecificComportement [

| valueIn collection |
collection := self nonEmptyWithCopyNonIdentical  .
valueIn := collection  values anyOne.

self assert: (collection includesIdentity: valueIn ) .
self deny: (collection includesIdentity: valueIn copy ) .
]

{ #category : #'tests - dictionary including' }
AssociationListTest >> testIncludesKey [

	| collection keyIn nonExistantKey |

	collection := self nonEmpty .
	keyIn := collection keys anyOne.
	nonExistantKey := self keyNotInNonEmpty. 

	self assert: ( collection includesKey: keyIn ).
	self deny: ( collection includesKey: nonExistantKey ).
]

{ #category : #'tests - iterating' }
AssociationListTest >> testInjectInto [

	| result |
	result := self collectionWithoutNilElements
		          inject: 0
		          into: [ :inj :ele | ele notNil ifTrue: [ inj + 1 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testIntersectionBasic [
	| inter |
	inter := self collection intersection: (self collectionClass with: self anotherElementOrAssociationIn).
	self denyEmpty: inter.
	self assert: (inter includes: self anotherElementOrAssociationIn value)
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testIntersectionEmpty [
	| inter |
	inter := self empty intersection: self empty.
	self assertEmpty: inter.
	inter := self empty intersection: self collection.
	self assert: inter equals: self empty
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testIntersectionItself [
	
	| result |
	result := self collectionWithoutEqualElements intersection: self collectionWithoutEqualElements.
	self assert: result size equals: self collectionWithoutEqualElements size.
	self collectionWithoutEqualElements do: [ :each|
		self assert: (result includes: each) ].
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testIntersectionTwoSimilarElementsInIntersection [

	| inter |
	inter := self collection intersection: (self collectionClass with: self anotherElementOrAssociationIn).
	self assert: (self collection occurrencesOf: self anotherElementOrAssociationIn) equals: self numberOfSimilarElementsInIntersection.
	self assert: (inter includes: self anotherElementOrAssociationIn value)
]

{ #category : #'tests - empty' }
AssociationListTest >> testIsEmpty [
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty
]

{ #category : #'tests - empty' }
AssociationListTest >> testIsEmptyOrNil [
	self assert: self empty isEmptyOrNil.
	self deny: self nonEmpty isEmptyOrNil
]

{ #category : #'tests - dictionary key access' }
AssociationListTest >> testKeyAtIdentityValue [

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtIdentityValue: value.
	self assert: (dict at: result) equals: value.

	self
		should: [ dict keyAtIdentityValue: self valueNotIn ]
		raise: Error
]

{ #category : #'tests - dictionary key access' }
AssociationListTest >> testKeyAtIdentityValueIfAbsent [

	"self run: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtIdentityValue: value ifAbsent: [ nil ].
	self assert: (dict at: result) equals: value.
	self
		assert: (dict keyAtIdentityValue: self valueNotIn ifAbsent: [ nil ])
		equals: nil
]

{ #category : #'tests - dictionary key access' }
AssociationListTest >> testKeyAtValue [

	"self run: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtValue: value.
	self assert: (dict at: result) equals: value.

	self should: [ dict keyAtValue: self valueNotIn ] raise: Error
]

{ #category : #'tests - dictionary key access' }
AssociationListTest >> testKeyAtValueIfAbsent [

	"self run: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.

	result := dict keyAtValue: value ifAbsent: [ nil ].
	self assert: (dict at: result) equals: value.
	self
		assert: (dict keyAtValue: self valueNotIn ifAbsent: [ nil ])
		equals: nil
]

{ #category : #'tests - dictionary keys values associations access' }
AssociationListTest >> testKeys [

	| collection result |
	collection := self nonEmpty.
	result := collection keys.
	result do: [ :key | collection at: key ].
	self assert: result size equals: collection size.
	self
		should: [ 
		result detect: [ :each | (result occurrencesOf: each) > 1 ] ]
		raise: Error
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testKeysAndValuesDo [

	| collection keys |
	collection := self nonEmptyDict.
	keys := OrderedCollection new.
	collection keysAndValuesDo: [ :key :value | 
		keys add: key.
		self assert: (collection at: key) equals: value ].

	collection keys do: [ :key | 
		self
			assert: (collection keys occurrencesOf: key)
			equals: (keys occurrencesOf: key) ]
]

{ #category : #'tests - removing' }
AssociationListTest >> testKeysAndValuesRemove [

	| oldSize collection keyIn |
	collection := self nonEmptyDict.
	oldSize := collection size.
	keyIn := collection keys anyOne.

	collection keysAndValuesRemove: [ :key :value | 
		key == self keyNotInNonEmptyDict ].
	self assert: collection size equals: oldSize.

	collection keysAndValuesRemove: [ :key :value | key == keyIn ].
	self assert: collection size equals: oldSize - 1.
	self should: [ collection at: keyIn ] raise: Error
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testKeysDo [

	| collection keys |
	collection := self nonEmptyDict.
	keys := OrderedCollection new.
	collection keysDo: [ :key | keys add: key ].

	collection keys do: [ :key | 
		self
			assert: (collection keys occurrencesOf: key)
			equals: (keys occurrencesOf: key) ]
]

{ #category : #'tests - dictionary keys values associations access' }
AssociationListTest >> testKeysSortedSafely [

	| collection result |
	collection := self nonEmpty.
	result := collection keysSortedSafely.
	result do: [ :key | collection at: key ].
	self assert: result size equals: collection size.
	self
		should: [ 
		result detect: [ :each | (result occurrencesOf: each) > 1 ] ]
		raise: Error.
	self assert: result asArray isSorted
]

{ #category : #'tests - iterating' }
AssociationListTest >> testNoneSatisfy [

	| element |
	self assert: ( self collectionWithoutNilElements  noneSatisfy: [:each | each notNil not ] ).
	element := self collectionWithoutNilElements anyOne.
	self deny: ( self collectionWithoutNilElements  noneSatisfy: [:each | (each = element)not ] ).
]

{ #category : #'tests - iterating' }
AssociationListTest >> testNoneSatisfyEmpty [

	self assert: ( self empty noneSatisfy: [:each | false]).
]

{ #category : #'tests - empty' }
AssociationListTest >> testNotEmpty [
	self assert: self nonEmpty notEmpty.
	self deny: self empty notEmpty
]

{ #category : #'tests - occurrencesOf' }
AssociationListTest >> testOccurrencesOf [
	| collection |
	collection := self collectionWithoutEqualElements .
	
	collection do: [ :each | self assert: (collection occurrencesOf: each) equals: 1 ]
]

{ #category : #'tests - occurrencesOf' }
AssociationListTest >> testOccurrencesOfEmpty [
	| result |
	result := self empty occurrencesOf: self collectionWithoutEqualElements anyOne.
	self assert: result equals: 0
]

{ #category : #'tests - occurrencesOf' }
AssociationListTest >> testOccurrencesOfNotIn [

	| result |
	result := self collectionWithoutEqualElements occurrencesOf: self elementNotInForOccurrences.
	self assert: result equals: 0
]

{ #category : #'tests - printing' }
AssociationListTest >> testPrintElementsOn [

	| aStream result allElementsAsString tmp |
	result := ''.
	aStream := ReadWriteStream on: result.
	tmp := OrderedCollection new.
	self nonEmpty do: [ :each | tmp add: each asString ].

	self nonEmpty printElementsOn: aStream.
	allElementsAsString := result findBetweenSubstrings: ' '.
	1 to: allElementsAsString size do: [ :i | 
		self
			assert: (tmp occurrencesOf: (allElementsAsString at: i))
			equals:
			(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ]
]

{ #category : #'tests - printing' }
AssociationListTest >> testPrintNameOn [

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
AssociationListTest >> testPrintOn [

	| printed allElementsAsString tmp |
	tmp := OrderedCollection new.
	self nonEmpty associationsDo: [ :each | tmp add: each asString ].

	printed := String streamContents: [ :s | self nonEmpty printOn: s ].
	allElementsAsString := printed findBetweenSubstrings: ' ()'.
	1 to: allElementsAsString size do: [ :i | 
		i = 1 ifTrue: [ 
			self classToBeTested class name first isVowel
				ifTrue: [ self assert: (allElementsAsString at: i) equals: 'an' ]
				ifFalse: [ self assert: (allElementsAsString at: i) equals: 'a' ] ].
		i = 2 ifTrue: [ 
			self
				assert: (allElementsAsString at: i)
				equals: self classToBeTested name ].
		i > 2 ifTrue: [ 
			self
				assert: (tmp occurrencesOf: (allElementsAsString at: i))
				equals:
				(allElementsAsString occurrencesOf: (allElementsAsString at: i)) ] ]
]

{ #category : #'tests - printing' }
AssociationListTest >> testPrintOnDelimiter [
	
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
AssociationListTest >> testPrintOnDelimiterLast [

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

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testReject [

	"Ensure that Dictionary>>reject: answers a dictionary not something else"

	| collection result |
	collection := self nonEmptyDict.
	result := collection reject: [ :each | false ].
	self assert: result equals: collection
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectAllThenCollect [
	| result |
	result := self collectionWithoutNilElements reject: [ :each | each notNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectAllThenDo [
	| result |
	
	result := self collectionWithoutNilElements 
		reject: [ :each | each notNil ] 
		thenDo: [ :each | self fail ].
	
	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectEmpty [

	| res |
	res := self empty reject: [ :each | each odd ].
	self assert: res size equals: self empty size
]

{ #category : #'tests - iterate' }
AssociationListTest >> testRejectNoReject [
	| res collection |
	collection := self collectionWithoutNilElements.
	res := collection reject: [ :each | each isNil ].
	self assert: res size equals: collection size
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectThenCollect [

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
	self assert: (result occurrencesOf: pivot) >= 1.
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectThenCollectEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenCollect: [ :each | self fail ])
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectThenDo [

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
	self assert: index equals: self collectionWithoutNilElements size - 1.
]

{ #category : #'tests - iterating' }
AssociationListTest >> testRejectThenDoOnEmpty [
	self assertEmpty: (self empty reject: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - removing' }
AssociationListTest >> testRemove [

	self should: [self nonEmptyDict remove: nil] raise: Error.
	self should: [self nonEmptyDict remove: nil ifAbsent: ['What ever here']] raise: Error.
]

{ #category : #'tests - removing' }
AssociationListTest >> testRemoveKey [

	| collection oldSize keyIn |
	collection := self nonEmptyDict.
	oldSize := collection size.
	keyIn := collection keys anyOne.

	collection removeKey: keyIn.
	self assert: collection size equals: oldSize - 1.
	self should: [ collection at: keyIn ] raise: Error.

	self
		should: [ collection removeKey: self keyNotInNonEmptyDict ]
		raise: Error
]

{ #category : #'tests - removing' }
AssociationListTest >> testRemoveKeyIfAbsent [

	| collection oldSize keyIn value result |
	collection := self nonEmptyDict.
	oldSize := collection size.
	keyIn := collection keys anyOne.
	value := collection at: keyIn.

	result := collection removeKey: keyIn ifAbsent: [ 888 ].
	self assert: result equals: value.
	self assert: collection size equals: oldSize - 1.
	self should: [ collection at: keyIn ] raise: Error.
	self
		assert:
		(collection removeKey: self keyNotInNonEmptyDict ifAbsent: [ 888 ])
		equals: 888
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testSelect [

	| collection values result |
	collection := self nonEmptyDict.
	values := OrderedCollection new.
	result := collection select: [ :value | 
		          values add: value.
		          true ].

	collection values do: [ :value | 
		self
			assert: (collection values occurrencesOf: value)
			equals: (values occurrencesOf: value) ].
	self assert: result equals: collection
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectNoneThenCollect [
	| result |
	result := self collectionWithoutNilElements select: [ :each | each isNil ] thenCollect: [ :each | self fail ].

	self assertEmpty: result
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectNoneThenDo [
	| result |
	
	result := self collectionWithoutNilElements 
		select: [ :each | each isNil ] 
		thenDo: [ self fail ].
	
	self assert: result equals: self collectionWithoutNilElements
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ])
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectThenCollect [

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
	self assert: (result occurrencesOf: pivot) >= 1.
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectThenCollectOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenCollect: [ self fail ])
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectThenDo [

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
	self assert: index equals: self collectionWithoutNilElements size - 1.
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSelectThenDoOnEmpty [
	self assertEmpty: (self empty select: [ :e | self fail ] thenDo: [ self fail ])
]

{ #category : #'tests - size capacity' }
AssociationListTest >> testSize [

	| size |
	self assert: self empty size equals: 0.
	size := 0.
	self sizeCollection do: [ :each | size := size + 1 ].
	self assert: self sizeCollection size equals: size
]

{ #category : #'tests - iterating' }
AssociationListTest >> testSumNumbers [

	| result |
	result := self collectionWithoutNilElements sumNumbers: [ :ele | 
		          ele notNil
			          ifTrue: [ 1 ]
			          ifFalse: [ 0 ] ].
	self assert: self collectionWithoutNilElements size equals: result
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testUnion [
	
	| union |
	union := self empty union: self nonEmpty.
	self containsAll: union of: self empty andOf: self nonEmpty.
	union := self nonEmpty union: self empty.
	self containsAll: union of: self empty andOf: self nonEmpty.
	union := self collection union: self nonEmpty.
	self containsAll: union of: self collection andOf: self nonEmpty.
]

{ #category : #'tests - set arithmetic' }
AssociationListTest >> testUnionOfEmpties [
	self assertEmpty: (self empty union: self empty)
]

{ #category : #'tests - dictionary keys values associations access' }
AssociationListTest >> testValues [

	| collection result |
	collection := self nonEmpty.
	result := collection values.
	self assert: result size equals: collection size.
	result do: [ :each | 
		self
			assert: (collection occurrencesOf: each)
			equals: (result occurrencesOf: each) ]
]

{ #category : #'tests - dictionnary enumerating' }
AssociationListTest >> testValuesDo [

	| collection values |
	collection := self nonEmptyDict.
	values := OrderedCollection new.
	collection valuesDo: [ :value | values add: value ].

	collection values do: [ :value | 
		self
			assert: (collection values occurrencesOf: value)
			equals: (values occurrencesOf: value) ]
]

{ #category : #requirements }
AssociationListTest >> valueNotIn [
	^ valueNotIn
]

{ #category : #requirements }
AssociationListTest >> valueNotInNonEmpty [
	" return a value not included in nonEmpty"

	^ valueNotIn
]
