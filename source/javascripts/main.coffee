#= require_self
#= require_tree .
#= require modules
#= stub vendor

app = angular.module 'AngularAppName', [
  'ui.router'
]

configureHtml5mode = (locationProvider, routerProvider) ->
  locationProvider.html5Mode true
  routerProvider.otherwise -> '/'

provideStates = ($stateProvider) ->
  $stateProvider
    .state 'main',
      abstract: true
      views:
        'Content':
          template: '<ui-view/>'
    .state 'main.landing',
      url: '/'
      templateUrl: '/templates/landing/landing.html'
    .state 'main.compare',
      url: '/compare',
      templateUrl: '/templates/compare/compare.html'

configFunction = ($stateProvider, $locationProvider, $urlRouterProvider) ->
  configureHtml5mode $locationProvider, $urlRouterProvider
  provideStates $stateProvider

app.config ['$stateProvider', '$locationProvider', '$urlRouterProvider', configFunction]
