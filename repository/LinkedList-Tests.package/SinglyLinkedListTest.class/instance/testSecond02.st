tests
testSecond02
	self
		should: [ self empty second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]