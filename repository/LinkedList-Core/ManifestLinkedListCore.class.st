"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestLinkedListCore',
	#superclass : 'PackageManifest',
	#category : 'LinkedList-Core-Manifest',
	#package : 'LinkedList-Core',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleAllAnyNoneSatisfyRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AssociationList #noneSatisfy: #false)) #'2020-02-22T00:35:56.315061-03:00') #(#(#RGMethodDefinition #(#AssociationList #allSatisfy: #false)) #'2020-02-22T00:35:56.315411-03:00') #(#(#RGMethodDefinition #(#AssociationList #anySatisfy: #false)) #'2020-02-22T00:35:56.315708-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #noneSatisfy: #false)) #'2020-02-28T14:37:08.442296-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #allSatisfy: #false)) #'2020-02-28T14:37:08.442187-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #anySatisfy: #false)) #'2020-02-28T14:37:08.442356-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #noneSatisfy: #false)) #'2023-04-14T20:10:52.884145-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #allSatisfy: #false)) #'2023-04-14T20:10:52.884164-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #anySatisfy: #false)) #'2023-04-14T20:10:52.884086-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedList #addAll: #false)) #'2016-08-30T12:24:15.621668-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #addAll: #false)) #'2023-04-14T20:10:52.891279-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleDetectContainsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedList #noneSatisfy: #false)) #'2016-08-31T16:00:58.955449-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #allSatisfy: #false)) #'2016-08-31T16:00:58.95529-03:00') #(#(#RGMethodDefinition #(#AssociationList #noneSatisfy: #false)) #'2020-02-28T14:37:08.212976-03:00') #(#(#RGMethodDefinition #(#AssociationList #allSatisfy: #false)) #'2020-02-28T14:37:08.212355-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #anySatisfy: #false)) #'2020-02-28T14:37:08.212699-03:00') #(#(#RGMethodDefinition #(#AssociationList #anySatisfy: #false)) #'2020-02-28T14:37:08.212943-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #allSatisfy: #false)) #'2023-04-14T20:10:52.874357-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #anySatisfy: #false)) #'2023-04-14T20:10:52.873897-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #noneSatisfy: #false)) #'2023-04-14T20:10:52.874166-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'DoublyLinkedList class' #with:with:with:with:with: #true)) #'2023-04-14T20:40:57.044154-03:00') #(#(#RGMethodDefinition #(#'SinglyLinkedList class' #with:with:with:with:with: #true)) #'2023-04-14T20:40:57.043976-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleImplementedNotSentRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedQueue #initialize #false)) #'2023-09-03T12:25:19.648054-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedNode #hash #false)) #'2023-09-03T12:25:19.648019-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedQueue #postCopy #false)) #'2023-09-03T12:25:19.647926-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedStack #initialize #false)) #'2023-09-03T12:25:19.647982-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #= #false)) #'2023-09-03T12:25:19.648037-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #postCopy #false)) #'2023-09-03T12:25:19.648086-03:00') #(#(#RGMethodDefinition #(#'OrderedPair class' #second: #true)) #'2023-09-03T12:25:19.647656-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #postCopy #false)) #'2023-09-03T12:25:19.647882-03:00') #(#(#RGMethodDefinition #(#AssociationList #postCopy #false)) #'2023-09-03T12:25:19.647947-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #hash #false)) #'2023-09-03T12:25:19.647964-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #hash #false)) #'2023-09-03T12:25:19.64746-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedNode #hash #false)) #'2023-09-03T12:25:19.648001-03:00') #(#(#RGMethodDefinition #(#AssociationList #= #false)) #'2023-09-03T12:25:19.64807-03:00') #(#(#RGMethodDefinition #(#'OrderedPair class' #first: #true)) #'2023-09-03T12:27:32.555239-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedNode #release #false)) #'2023-09-03T12:27:32.554313-03:00') #(#(#RGMethodDefinition #(#OrderedPair #hash #false)) #'2023-09-03T12:27:32.555114-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedList #initialize #false)) #'2023-09-03T12:27:32.555153-03:00') #(#(#RGMethodDefinition #(#AssociationList #release #false)) #'2023-09-03T12:27:32.55517-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedNode #= #false)) #'2023-09-03T12:27:32.55473-03:00') #(#(#RGMethodDefinition #(#OrderedPair #= #false)) #'2023-09-03T12:27:32.555187-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #= #false)) #'2023-09-03T12:27:32.555004-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #initialize #false)) #'2023-09-03T12:27:32.555303-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedNode #= #false)) #'2023-09-03T12:27:32.555264-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedNode #release #false)) #'2023-09-03T12:27:32.555285-03:00') #(#(#RGMethodDefinition #(#AssociationList #hash #false)) #'2023-09-03T12:27:32.555093-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedStack #postCopy #false)) #'2023-09-03T12:27:32.555134-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedNode #value #false)) #'2016-08-30T12:24:15.598941-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedNode #release #false)) #'2023-04-14T20:15:59.716734-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedNode #release #false)) #'2023-04-14T20:15:59.71611-03:00') #(#(#RGMethodDefinition #(#AssociationList #release #false)) #'2023-04-14T20:15:59.716503-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedNode #value #false)) #'2023-04-14T20:15:59.716802-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AssociationList #isNotEmpty #false)) #'2020-02-22T00:35:56.791647-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedQueue #isNotEmpty #false)) #'2020-02-28T07:28:09.080435-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #isNotEmpty #false)) #'2020-02-28T07:28:09.08075-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedStack #isNotEmpty #false)) #'2020-02-28T07:28:09.081007-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleRBOverridesDeprecatedMethodRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AssociationList #asOrderedCollection #false)) #'2023-04-14T20:12:39.796219-03:00') )
]

{ #category : 'code-critics' }
ManifestLinkedListCore class >> ruleUtilityMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#AssociationList #is:equalTo: #false)) #'2020-02-22T00:35:55.836527-03:00') #(#(#RGMethodDefinition #(#IdentityAssociationList #is:equalTo: #false)) #'2020-02-28T07:25:15.150901-03:00') #(#(#RGMethodDefinition #(#UndefinedObject #removeNodeFrom: #false)) #'2023-09-03T12:34:42.786321-03:00') )
]
