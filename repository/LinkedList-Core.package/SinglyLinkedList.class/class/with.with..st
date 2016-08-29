instance creation
with: firstObject with: secondObject
	"Answer an instance of me containing firstObject and secondObject."

	^ self new
		add: firstObject;
		add: secondObject;
		yourself