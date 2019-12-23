Class {
	#name : #AssociationListTest,
	#superclass : #CollectionRootTest,
	#traits : 'TIncludesTest + TDictionaryAddingTest + TDictionaryComparingTest + TDictionaryCopyingTest + TDictionaryEnumeratingTest + TDictionaryRemovingTest + (TPutBasicTest - {#testAtPutOutOfBounds}) + TAsStringCommaAndDelimiterTest + TPrintTest + TConvertTest + TConvertAsSortedTest + (TCopyTest - {#testCopyEmptyWithout. #testCopyNonEmptyWithout. #testCopyNonEmptyWithoutNotIncluded}) + TSetArithmetic + TDictionaryIncludesWithIdentityCheckTest + TDictionaryValueAccessTest + TOccurrencesTest + TDictionaryKeyAccessTest + TDictionaryAssociationAccessTest',
	#classTraits : 'TIncludesTest classTrait + TDictionaryAddingTest classTrait + TDictionaryComparingTest classTrait + TDictionaryCopyingTest classTrait + TDictionaryEnumeratingTest classTrait + TDictionaryRemovingTest classTrait + TPutBasicTest classTrait + TAsStringCommaAndDelimiterTest classTrait + TPrintTest classTrait + TConvertTest classTrait + TConvertAsSortedTest classTrait + TCopyTest classTrait + TSetArithmetic classTrait + TDictionaryIncludesWithIdentityCheckTest classTrait + TDictionaryValueAccessTest classTrait + TOccurrencesTest classTrait + TDictionaryKeyAccessTest classTrait + TDictionaryAssociationAccessTest classTrait',
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
		'nonEmptyWithFloat'
	],
	#category : #'LinkedList-Tests-Unordered'
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
AssociationListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
AssociationListTest >> emptyDict [
	^ emptyList
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

	^ nonEmptyWithFloat
]

{ #category : #requirements }
AssociationListTest >> nonEmptyWithoutEqualsValues [
	"return a dictionary that doesn't include equal values"

	^ nonEmpty5ElementsNoDuplicates
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
	collectionIncluded := { 1 }.
	collectionNotIncluded := { valueNotIn. valueNotIn }.
	nonEmptyWithFloat := self classToBeTested new add: #A->2.5; add: #b->3.5; yourself.
]

{ #category : #requirements }
AssociationListTest >> sizeCollection [
	"Answers a collection not empty"
	^ alist
]

{ #category : #'test - adding' }
AssociationListTest >> testAddWithKeyNotIn [
	| dictionary result association oldSize |
	dictionary := self nonEmptyDict.
	oldSize := dictionary size.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.
	
	self assert: result = association.
	self assert: (dictionary at: association key) = association value.
	self assert: dictionary size = (oldSize  + 1).
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
