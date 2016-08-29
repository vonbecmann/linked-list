test - iterate
testDetectWhenNobodyIsFound
	self should: [ self collectionWithoutNilElements detect: [ :each | each isNil ] ] raise: NotFound