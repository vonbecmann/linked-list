enumerating
collect: collectBlock thenSelect: selectBlock
	"Utility method to improve readability."
	"Optimized version."

	| newCollection newElement |
	newCollection := self class new.
	self
		do: [ :each | 
			newElement := collectBlock value: each.
			(selectBlock value: newElement)
				ifTrue: [ newCollection add: newElement ] ].
	^ newCollection