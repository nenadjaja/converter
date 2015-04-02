unitsConverter = angular.module 'unitsConverter', ['ngRoute', 'templates']

unitsConverter.config ($routeProvider) =>
  $routeProvider.when('/',
  {
      controller: "unitsController",
      templateUrl: "layout.html"
  }).
  otherwise({
      redirectTo: '/'
  });

window.unitsConverter = unitsConverter;
