"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestLinkedListTests,
	#superclass : #PackageManifest,
	#category : #'LinkedList-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestLinkedListTests class >> ruleNotEliminationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#DoublyLinkedListTest #testRejectNoReject #false)) #'2023-09-03T12:03:19.48957-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedListTest #testSelect #false)) #'2023-09-03T12:03:19.489147-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedListTest #testReject #false)) #'2023-09-03T12:03:19.489551-03:00') #(#(#RGMethodDefinition #(#SinglyLinkedListTest #testRejectNoReject #false)) #'2023-09-03T12:03:19.489519-03:00') #(#(#RGMethodDefinition #(#DoublyLinkedListTest #testReject #false)) #'2023-09-03T12:03:19.489322-03:00') )
]
