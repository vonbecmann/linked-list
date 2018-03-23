Extension { #name : #SinglyLinkedList }

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedList class >> gtExample [
	<gtExample>
	^ SinglyLinkedList withAll: (17 to: 23)
]

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedList >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite list
		title: [ 'Items' ];
		display: [ self asArray ];
		format: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]
