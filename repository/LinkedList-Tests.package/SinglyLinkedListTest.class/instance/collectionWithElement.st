requirements
collectionWithElement
	"Returns a collection that already includes what is returned by #element."

	^ self empty
		add: self element;
		yourself