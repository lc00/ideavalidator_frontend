ideaValidator = angular.module 'ideaValidator', ['ngRoute']

ideaValidator.config ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/landing', 
			templateUrl: '/partials/landing.html',
			controller: 'LandingController'
		.when '/learnAboutGivingFeedback',
			templateUrl: '/partials/learnAboutGivingFeedback.html'
		.when '/learnAboutHostingIdeas',
			templateUrl: '/partials/learnAboutHostingIdeas.html'
		.otherwise redirectTo: '/landing'

	$locationProvider.html5Mode 
		enabled: true,
		requireBase: false