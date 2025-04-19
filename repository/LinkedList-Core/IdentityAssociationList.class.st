"
an identity association list

"
Class {
	#name : 'IdentityAssociationList',
	#superclass : 'AssociationList',
	#category : 'LinkedList-Core-Dictionaries',
	#package : 'LinkedList-Core',
	#tag : 'Dictionaries'
}

{ #category : 'private' }
IdentityAssociationList >> is: firstKey equalTo: secondKey [
	" is first key equal to second key?. i'm a utility method."

	^ firstKey == secondKey
]
