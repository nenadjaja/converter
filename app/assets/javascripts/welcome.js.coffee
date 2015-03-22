# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unitsConverter = angular.module 'unitsConverter', []

unitsConverter.controller 'testController', ['$scope', ($scope) =>

  # scope variables
  $scope.inputNumber = 1
  # volume dry
  $scope.volumeDry = 
    toOunce:
      "ounce": 1
      "pound": 16
      "gram": 0.035273962
      "kilogram": 35.274
      "tsp": 0.1667
      "tbsp": 0.5
      "cup": 8    
    fromOunce: 
      "ounce": 1
      "pound": 0.0625
      "gram": 28.349523125
      "kilogram": 0.0283495
      "tsp": 6
      "tbsp": 2
      "cup": 0.125 

  $scope.volumeLiquid = 
    toOunce:
      "ounce": 20
      "pound": 16
      "gram": 0.035273962
      "kilogram": 35.274
      "tsp": 0.1667
      "tbsp": 0.5
      "cup": 8  
      "flounce": 1 
      "pint": 16
      "milliliter": 0.033333
      "liter": 32
    fromOunce:
      "ounce": 1
      "pound": 0.0625
      "gram": 28.349523125
      "kilogram": 0.0283495
      "tsp": 6
      "tbsp": 2
      "cup": 0.125 
      "flounce": 1
      "pint": 0.0625
      "milliliter": 30
      "liter": 0.03125

  $scope.weight = 
    toOunce:
      "ounce": 1
      "pound": 16
      "gram": 0.035273962
      "kilogram": 35.274
      "tsp": 0.1667
      "tbsp": 0.5
      "cup": 8    
    fromOunce: 
      "ounce": 1
      "pound": 0.0625
      "gram": 28.349523125
      "kilogram": 0.0283495
      "tsp": 6
      "tbsp": 2
      "cup": 0.125 



  $scope.state = "weight"

  # it converts input unit into the output unit
  # depending on the quantity and ratio betw units
  $scope.convertToUnit = (unitFrom, unitTo, quantity) =>
    unitToOunceRatio = $scope[$scope.state].toOunce[unitFrom]
    ounceToUnitRatio = $scope[$scope.state].fromOunce[unitTo]
    (unitToOunceRatio * ounceToUnitRatio * quantity).toFixed(4)

  # click handlers
  # TODO: find a more elegant way to do the styling
  $scope.selectFirstUnit = (event) =>
    $scope.styleSelected('[data-js=from-unit]');

    # conversion logic
    input = event.target.textContent.toLowerCase().replace(/\s+/g,'')
    output = $('[data-js=to-unit]').find('.selected').text().toLowerCase().replace(/\s+/g,'')
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
    input = $('[data-js=from-unit]').find('.selected').text().toLowerCase().replace(/\s+/g,'')
    output = $('[data-js=to-unit]').find('.selected').text().toLowerCase().replace(/\s+/g,'')
    result = $scope.convertToUnit(input, output, quantity)
    $('.input-number')[1].value = result

  # styling related
  $scope.styleSelected = (element) =>
    if $(event.target).is ":button"
      $(element).find('button').removeClass('default-color').removeClass('selected');
      $(event.target).addClass('default-color').addClass('selected');
]