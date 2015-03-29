unitsConverter.service 'unitsModels', ['$rootScope', ($rootScope) => 

  volumes =
    volumedry:
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
    volumeliquid:
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