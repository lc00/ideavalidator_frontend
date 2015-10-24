ideaValidator.controller 'LandingController', ['$scope', '$location', ($scope, $location) ->
	$scope.learnAboutGivingFeedback = ->
		$location.path 'learnAboutGivingFeedback'

	$scope.learnAboutHostingIdeas = ->
		$location.path 'learnAboutHostingIdeas'
]