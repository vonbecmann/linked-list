coverage
selectorsToBeIgnored

	| private | 
	private := #( #initialize #errorNotFound: #emptyError #firstNode #gtInspectorItemsIn: #postCopy).
	^ super selectorsToBeIgnored, private
