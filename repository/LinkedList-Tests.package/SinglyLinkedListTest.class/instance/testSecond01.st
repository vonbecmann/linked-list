tests
testSecond01
	| newList |
	newList := self empty.
	newList add: 1.
	self
		should: [ newList second ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'collection is empty!' ]