tests
testEmptyError
	self should: [ stack top ] raise: Error.
	self should: [ stack pop ] raise: Error.
	stack push: 'element'.
	stack top.
	stack pop.	"The stack is empty again due to previous pop"
	self should: [ stack top ] raise: Error.
	self should: [ stack pop ] raise: Error