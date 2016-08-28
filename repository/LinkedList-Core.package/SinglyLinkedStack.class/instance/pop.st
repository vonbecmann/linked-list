removing
pop
	"Returns the first element and remove it from the stack."

	| firstElement |
	firstElement := self top.
	firstNode := firstNode nextNode.
	tally := tally - 1.
	^ firstElement