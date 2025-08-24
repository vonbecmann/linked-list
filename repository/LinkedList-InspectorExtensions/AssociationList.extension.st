Extension { #name : 'AssociationList' }

{ #category : '*LinkedList-InspectorExtensions' }
AssociationList class >> example [

	<sampleInstance>
	^ self new
		  add: #a -> 'hello world';
		  add: #b -> 2.5;
		  add: #c -> 4;
		  add: #c -> #symbol;
		  add: #c -> $a;
		  yourself
]

{ #category : '*LinkedList-InspectorExtensions' }
AssociationList class >> exampleAnother [

	<sampleInstance>
	^ self new
		  add: 1 -> #a;
		  add: 2 -> #b;
		  add: 3 -> #b;
		  add: 3 -> #c;
		  yourself
]

{ #category : '*LinkedList-InspectorExtensions' }
AssociationList >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn
				   title: 'Key'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each key ]);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each value ]);
		  items: (self associations collect: [ :e |
					   StInspectorAssociationNode hostObject: e ]);
		  yourself
]

{ #category : '*LinkedList-InspectorExtensions' }
AssociationList >> inspectionKeys: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Keys'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn
				   title: 'Key'
				   evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ]);
		  items: self keys;
		  yourself
]
