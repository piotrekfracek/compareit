ConfigureMenuValues =
  isVertical:     true
  isHorizontal:   false
  orientation:    'height'
##  mouseDirection: Math.floor(event.offsetY)  (ERROR: Cannot read property 'offsetY' of undefined), WTF?

angular.module('Compareit').value 'ConfigureMenuValues', ConfigureMenuValues
