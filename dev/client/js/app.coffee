ideaValidator = angular.module 'ideaValidator', ['ngRoute']

ideaValidator.config ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/landing', 
			templateUrl: '/partials/landing.html'
		.otherwise redirectTo: '/landing'

	$locationProvider.html5Mode 
		enabled: true,
		requireBase: false