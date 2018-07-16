"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLinkedListCore,
	#superclass : #PackageManifest,
	#category : #'LinkedList-Core'
}

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
