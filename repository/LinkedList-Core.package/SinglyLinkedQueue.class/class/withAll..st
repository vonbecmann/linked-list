instance creation
withAll: aCollection
	"Create a new queue containing all the elements from aCollection."

	^ self new
		nextPutAll: aCollection;
		yourself