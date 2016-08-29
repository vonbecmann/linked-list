tests
testFirst01
	self
		should: [ self empty first ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]