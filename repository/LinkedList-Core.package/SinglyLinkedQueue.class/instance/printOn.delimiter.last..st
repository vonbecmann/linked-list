printing
printOn: aStream delimiter: delimString last: lastDelimString
	"Print elements on a stream separated
	with a delimiter between all the elements and with
	a special one before the last like: 'a, b and c'"

	| current |
	current := firstNode.
	[ current isNil ]
		whileFalse: [ 
			current == lastNode
				ifTrue: [ aStream print: lastDelimString ]
				ifFalse: [ 
					current == firstNode
						ifFalse: [ aStream print: delimString ] ].
			aStream print: current value.
			current := current nextNode ]