# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unitsConverter = angular.module 'unitsConverter', []

unitsConverter.controller 'testController', ['$scope', ($scope) =>

  # variables
  $scope.inputNumber = 1
  $scope.conversions = 
    "ounce":
      "ounce": 1
      "pound": 16
      "gram": 0.035274
      "kilogram": 35.274
      "tsp": 0.1667
      "tbsp": 0.5
      "cup": 8     
    "pound": 
      "ounce": 16
      "pound": 1
      "gram": 453.592
      "kilogram": 0.453592
      "tsp": 96
      "tbsp": 32
      "cup": 2
    "gram":
      "ounce": 0.035274
      "pound": 0.0022
      "gram": 1
      "kilogram": 0.001
      "tsp": 0.203
      "tbsp": 0.0667
      "cup": 0.00423
    "kilogram":
      "ounce": 35.274
      "pound": 2.20462
      "gram": 1000
      "kilogram": 1
      "tsp": 175.82
      "tbsp": 66.6667
      "cup": 8
    "tsp":
      "ounce": 0.1667
      "pound": 0.01
      "gram": 4.92892
      "kilogram": 0.01
      "tsp": 1
      "tbsp": 0.3333
      "cup": 0.0208333
    "tbsp":
      "ounce": 0.5
      "pound": 32
      "gram": 15
      "kilogram": 0.02
      "tsp": 3
      "tbsp": 1
      "cup": 0.0625
    "cup":
      "ounce": 8
      "pound": 0.52159
      "gram": 236.58824
      "kilogram": 0.23659
      "tsp": 48
      "tbsp": 16
      "cup": 1

  # helper methods
  $scope.convertToUnit = (unitFrom, unitTo, quantity) =>
    options = $scope.conversions[unitFrom]
    ratio = options[unitTo]
    result = (parseFloat(quantity) * ratio).toFixed(4)
  #  if parseInt(result) is 0 then return 0 else return result
    result

  # click handlers
  # NOTE: It has to be a better way to do the styling
  $scope.selectFirstUnit = (event) =>
    # CSS stuff
    $('.first-group').find('button').removeClass('default-color')
    $(event.target).addClass('default-color')

    # logic stuff
    input = event.target.textContent.toLowerCase()
    output = $('.second-group').find('.default-color').text().toLowerCase()
    quantity = parseFloat($('.input-number')[0].value)
    result = $scope.convertToUnit(input, output, quantity)
    $('.input-number')[1].value = result
    false 

  $scope.selectSecondUnit = (event) =>
    $('.second-group').find('button').removeClass('default-color')
    $(event.target).addClass('default-color')
    false

  $scope.updateSecondUnit = (quantity) =>
    unless quantity
      $('.input-number')[1].value = ""
      return 
    input = $('.first-group').find('.default-color').text().toLowerCase()
    output = $('.second-group').find('.default-color').text().toLowerCase()
    result = $scope.convertToUnit(input, output, quantity)
    $('.input-number')[1].value = result
]