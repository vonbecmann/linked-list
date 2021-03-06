Extension { #name : #DoublyLinkedList }

{ #category : #'*LinkedList-InspectorExtensions' }
DoublyLinkedList >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite list
		title: [ 'Items' ];
		display: [ self asArray ];
		format: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]
