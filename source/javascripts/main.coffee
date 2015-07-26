#= require_self
#= require_tree .
#= require modules
#= stub vendor

app = angular.module 'Compareit', [
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
      url: '/compare/{image1}/{x1}/{y1}/{scale1}/{image2}/{x2}/{y2}/{scale2}/{orientation}',
      templateUrl: '/templates/compare/compare.html'

configFunction = ($stateProvider, $locationProvider, $urlRouterProvider) ->
  configureHtml5mode $locationProvider, $urlRouterProvider
  provideStates $stateProvider

app.config ['$stateProvider', '$locationProvider', '$urlRouterProvider', configFunction]

runFunction = ($q) ->
  app.global =
    $q: $q

app.run ['$q', runFunction]
