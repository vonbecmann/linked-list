tests
testEqual07
	| one another |
	one := SinglyLinkedList with: 2.
	another := SinglyLinkedList with: 2 with: 3.	
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another.
	
	