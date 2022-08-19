Extension { #name : #SinglyLinkedQueue }

{ #category : #'*LinkedList-InspectorExtensions' }
SinglyLinkedQueue >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  addColumn: (SpIndexTableColumn title: 'Index');
		  addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ]);
		  items: self asArray;
		  yourself
]
