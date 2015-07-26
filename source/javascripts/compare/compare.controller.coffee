class CompareCtrl

  constructor: (@CompareValues, @CompareService) ->

  getOrientation:   -> @CompareService.getOrientation()

  toggleCompare:    -> @CompareService.toggleCompare()
  isCompareEnabled: -> @CompareService.isCompareEnabled()

angular
  .module 'Compareit'
  .controller 'CompareCtrl', ['CompareValues', 'CompareService', CompareCtrl]
