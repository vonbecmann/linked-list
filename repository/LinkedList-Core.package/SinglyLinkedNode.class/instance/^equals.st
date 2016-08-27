comparing
= anObject
	^ self class == anObject class
		and: [ value = anObject value and: [ nextNode == anObject nextNode ] ]