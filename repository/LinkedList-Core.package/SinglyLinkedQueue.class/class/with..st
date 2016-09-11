instance creation
with: anObject
	"Answer an instance of me containing anObject."

	^ self new
		nextPut: anObject;
		yourself