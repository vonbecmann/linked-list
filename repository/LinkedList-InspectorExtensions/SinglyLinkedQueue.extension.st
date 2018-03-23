Extension { #name : #SinglyLinkedQueue }

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedQueue class >> gtExample [
	<gtExample>
	^ SinglyLinkedQueue withAll: ($a to: $h)
]

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedQueue >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite list
		title: [ 'Items' ];
		display: [ self asArray ];
		format: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]
