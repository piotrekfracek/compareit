class CompareCtrl

  constructor: (@CompareValues, @CompareService) ->

  toggleCompare:    -> @CompareService.toggleCompare()
  isCompareEnabled: -> @CompareService.isCompareEnabled()

angular
  .module 'Compareit'
  .controller 'CompareCtrl', ['CompareValues', 'CompareService', CompareCtrl]
