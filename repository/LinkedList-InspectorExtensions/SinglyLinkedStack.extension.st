Extension { #name : #SinglyLinkedStack }

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedStack class >> gtExample [
	<gtExample>
	^ SinglyLinkedStack withAll: ($a to: $h)
]

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedStack >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite list
		title: [ 'Items' ];
		display: [ self asArray ];
		format: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]
