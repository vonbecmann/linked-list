Class {
	#name : #AssociationListTest,
	#superclass : #CollectionRootTest,
	#traits : 'TIncludesTest + TDictionaryAddingTest + TDictionaryComparingTest + TDictionaryCopyingTest + TDictionaryEnumeratingTest + TDictionaryRemovingTest',
	#classTraits : 'TIncludesTest classTrait + TDictionaryAddingTest classTrait + TDictionaryComparingTest classTrait + TDictionaryCopyingTest classTrait + TDictionaryEnumeratingTest classTrait + TDictionaryRemovingTest classTrait',
	#instVars : [
		'alist',
		'valueNotIn',
		'keyNotIn',
		'associationNotIn',
		'nonEmpty5ElementsNoDuplicates',
		'emptyList',
		'notIncludedList'
	],
	#category : #'LinkedList-Tests'
}

{ #category : #requirements }
AssociationListTest >> anotherElementNotIn [
	" return an element different of 'elementNotIn'  not included in 'nonEmpty' "

	^ 937
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
AssociationListTest >> collectionClass [
	" return the class to be used to create instances of the class tested"

	^ self classToBeTested
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
AssociationListTest >> empty [
	^ self classToBeTested new
]

{ #category : #requirements }
AssociationListTest >> emptyDict [
	^ emptyList
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
AssociationListTest >> nonEmptyDict [
	^ alist
]

{ #category : #requirements }
AssociationListTest >> nonEmptyDifferentFromNonEmptyDict [
	" return a dictionary for which all keys are not included in nonEmptyDict"

	^ notIncludedList
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
	nonEmpty5ElementsNoDuplicates := self classToBeTested new.
	nonEmpty5ElementsNoDuplicates
		at: #a put: 1;
		at: #b put: 30;
		at: #c put: 13;
		at: #d put: -2.
	valueNotIn := 666.
	keyNotIn := #z.
	associationNotIn := keyNotIn -> valueNotIn.
	notIncludedList := self classToBeTested new
		add: associationNotIn;
		yourself
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
