Extension { #name : 'SinglyLinkedList' }

{ #category : '*LinkedList-InspectorExtensions' }
SinglyLinkedList >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: ((SpIndexTableColumn title: '#')
				   beNotExpandable;
				   yourself);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ]);
		  items: self asArray;
		  yourself
]
