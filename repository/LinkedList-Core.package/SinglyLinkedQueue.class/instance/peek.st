accessing
peek
	^ firstNode ifNil: [ nil ] ifNotNil: [ firstNode value ]