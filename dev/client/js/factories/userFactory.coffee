ideaValidator.factory 'UserFactory', [->
	currentUser = ->
		return JSON.parse localStorage.getItem 'user'

	return {
		currentUser
	}
]