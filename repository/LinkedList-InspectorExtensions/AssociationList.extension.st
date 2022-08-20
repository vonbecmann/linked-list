Extension { #name : #AssociationList }

{ #category : #'*LinkedList-InspectorExtensions' }
AssociationList >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Key' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each key ]);
		  addColumn: (SpStringTableColumn title: 'Value' evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each value ]);
		  items: (self associations collect: [ :e | StInspectorAssociationNode hostObject: e ]);
		  yourself
]
