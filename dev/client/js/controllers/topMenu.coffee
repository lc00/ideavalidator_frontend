ideaValidator.controller 'TopMenuController', ['$scope', 'UserFactory', '$location', ($scope, UserFactory, $location) ->
	$scope.user = UserFactory.currentUser()

	$scope.login = ->
		$location.path 'login'

	$scope.createAccount = ->
		$location.path 'createAccount'
]