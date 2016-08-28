accessing
top
	"Answer the first element of the stack without removing it."

	^ firstNode 
			ifNil: [ Error signal: 'collection is empty!' ] 
			ifNotNil: [ firstNode value ]