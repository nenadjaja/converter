unitsConverter = angular.module 'unitsConverter', ['ngRoute', 'templates']

unitsConverter.config ($routeProvider) =>
  $routeProvider.when('/',
  {
      controller: "unitsController",
      templateUrl: "volume_dry_view.html"
  }).
  otherwise({
      redirectTo: '/'
  });

window.unitsConverter = unitsConverter;
