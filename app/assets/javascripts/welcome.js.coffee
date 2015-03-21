# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unitsConverter = angular.module 'unitsConverter', []

unitsConverter.controller 'testController', ['$scope', ($scope) =>

  # variables
  $scope.inputNumber = 1
  $scope.toOunce = 
    "ounce": 1
    "pound": 16
    "gram": 0.035273962
    "kilogram": 35.274
    "tsp": 0.1667
    "tbsp": 0.5
    "cup": 8    
  $scope.fromOunce = 
    "ounce": 1
    "pound": 0.0625
    "gram": 28.349523125
    "kilogram": 0.0283495
    "tsp": 6
    "tbsp": 2
    "cup": 0.125 
  

  # it converts input unit into the output unit
  # depending on the quantity and ratio betw units
  $scope.convertToUnit = (unitFrom, unitTo, quantity) =>
    unitToOunceRatio = $scope.toOunce[unitFrom]
    ounceToUnitRatio = $scope.fromOunce[unitTo]
    (unitToOunceRatio * ounceToUnitRatio * quantity).toFixed(4)

  # click handlers
  # TODO: find a more elegant way to do the styling
  $scope.selectFirstUnit = (event) =>
    $scope.styleSelected('[data-js=from-unit]');

    # conversion logic
    input = event.target.textContent.toLowerCase()
    output = $('[data-js=to-unit]').find('.selected').text().toLowerCase()
    quantity = parseFloat($('.input-number')[0].value)
    result = $scope.convertToUnit(input, output, quantity)
    $('.input-number')[1].value = result
    false 

  $scope.selectSecondUnit = (event) =>
    $scope.styleSelected('[data-js=to-unit]');
    false

  $scope.updateSecondUnit = (quantity) =>
    unless quantity
      $('.input-number')[1].value = ""
      return 
    input = $('[data-js=from-unit]').find('.selected').text().toLowerCase()
    output = $('[data-js=to-unit]').find('.selected').text().toLowerCase()
    result = $scope.convertToUnit(input, output, quantity)
    $('.input-number')[1].value = result

  # styling related
  $scope.styleSelected = (element) =>
    $(element).find('button').removeClass('default-color').removeClass('selected');
    $(event.target).addClass('default-color').addClass('selected');
]