# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unitsConverter = angular.module 'unitsConverter', []

unitsConverter.controller 'testController', ['$scope', ($scope) =>
	# variables
	$scope.message = "Welcome to Converter"
	$scope.inputNumber = 1;
	
	# methods
	$scope.convertToGrams = (ounce) =>
    result = (parseFloat(ounce) * 28.3495).toFixed(2)
    if parseInt(result) is 0 then return 0 else return result
]