accessing
second
	"Answer the second element of the receiver"

	"Create an error notification if the receiver is 	empty."

	^ firstNode
		ifNil: [ self emptyError ]
		ifNotNil: [ firstNode nextNode ifNil: [ self emptyError ] ifNotNil: [ firstNode nextNode value ] ]