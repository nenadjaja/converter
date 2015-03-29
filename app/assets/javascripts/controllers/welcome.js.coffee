# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

unitsConverter.controller 'unitsController', ['$scope', 'unitsModels', ($scope, unitsModels) =>

  # scope variables
  $scope.inputNumber = 1
  # volume dry
  $scope.models = unitsModels[0];

  $scope.state = "weight"

  # it converts input unit into the output unit
  # depending on the quantity and ratio betw units
  $scope.convertToUnit = (unitFrom, unitTo, quantity) =>
    unitToOunceRatio = $scope.models[$scope.state].toOunce[unitFrom]
    ounceToUnitRatio = $scope.models[$scope.state].fromOunce[unitTo]
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