comparing
hash
	^ (self class hash + (value hash + nextNode identityHash) hashMultiply) hashMultiply