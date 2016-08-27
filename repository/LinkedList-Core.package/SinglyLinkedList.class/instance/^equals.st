comparing
= anObject
	| list1 list2 |
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self size = anObject size
		ifFalse: [ ^ false ].
	list1 := self firstNode.
	list2 := anObject firstNode.
	[ list1 isNil ]
		whileFalse: [ 
			list1 value = list2 value
				ifFalse: [ ^ false ].
			list1 := list1 nextNode.
			list2 := list2 nextNode ].
	^ true