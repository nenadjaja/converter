unitsConverter.service 'unitsModels', ['$rootScope', ($rootScope) => 

  volumes =
    volumedry:  # to mililiter
      toOunce:
        "tsp": 5
        "tbsp": 15
        "cup": 225   
        "pint": 450
        "ml": 1
        "liter": 1000
      fromOunce: 
        "tsp": 0.25
        "tbsp": 0.0666667
        "cup": 0.0044444 
        "pint": 0.0022222
        "ml": 1
        "liter": 0.001
    volumeliquid:
      toOunce:
        "floz": 1
        "tsp": 0.166667
        "tbsp": 0.5
        "cup": 8  
        "pint": 16
        "ml": 0.033814
        "liter": 32
      fromOunce:
        "floz": 1
        "tsp": 6
        "tbsp": 2
        "cup": 0.125 
        "pint": 0.0625
        "ml": 29.5735
        "liter": 0.0295735
    weight:
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

  $rootScope.list = [volumes]

]