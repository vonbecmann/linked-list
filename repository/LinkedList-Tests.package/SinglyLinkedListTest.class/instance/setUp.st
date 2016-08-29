running
setUp
	super setUp.
	list := self empty.
	list
		add: 1.2;
		add: $a;
		add: 7;
		add: 'test';
		add: true;
		add: false.
	otherList := self empty
		addAll: (7 to: 11);
		yourself