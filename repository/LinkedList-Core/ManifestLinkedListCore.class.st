"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLinkedListCore,
	#superclass : #PackageManifest,
	#category : #'LinkedList-Core'
}

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleAllAnyNoneSatisfyRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AssociationList #noneSatisfy: #false)) #'2020-02-22T00:35:56.315061-03:00') #(#(#RGMethodDefinition #(#AssociationList #allSatisfy: #false)) #'2020-02-22T00:35:56.315411-03:00') #(#(#RGMethodDefinition #(#AssociationList #anySatisfy: #false)) #'2020-02-22T00:35:56.315708-03:00') )
]

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedList #addAll: #false)) #'2016-08-30T12:24:15.621668-03:00') )
]

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleDetectContainsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedList #noneSatisfy: #false)) #'2016-08-31T16:00:58.955449-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedList #allSatisfy: #false)) #'2016-08-31T16:00:58.95529-03:00') )
]

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SinglyLinkedNode #value #false)) #'2016-08-30T12:24:15.598941-03:00') )
]

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AssociationList #isNotEmpty #false)) #'2020-02-22T00:35:56.791647-03:00') )
]

{ #category : #'code-critics' }
ManifestLinkedListCore class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AssociationList #is:equalTo: #false)) #'2020-02-22T00:35:55.836527-03:00') )
]
