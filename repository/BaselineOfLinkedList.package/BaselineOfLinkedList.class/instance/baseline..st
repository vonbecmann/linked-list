baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'LinkedList-Core';
				package: 'LinkedList-InspectorExtensions'
					with: [ spec requires: #('LinkedList-Core') ];
				package: 'LinkedList-Tests'
					with: [ spec requires: #('LinkedList-Core') ].
			spec
				group: 'default'
					with:
					#(	'LinkedList-Core' 
						'LinkedList-InspectorExtensions' 
						'LinkedList-Tests');
				group: 'Core' with: #('LinkedList-Core');
				group: 'Tests' with: #('LinkedList-Tests') ]