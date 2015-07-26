class CompareCtrl

  constructor: (@CompareValues, @CompareService) ->

  getOrientation:   -> @CompareService.getOrientation()

  enableCompare:           -> @CompareService.enableCompare()
  enableCompareAndRestore: -> @CompareService.enableCompareAndRestore()
  disableCompare:          -> @CompareService.disableCompare()
  isCompareEnabled:        -> @CompareService.isCompareEnabled()

angular
  .module 'Compareit'
  .controller 'CompareCtrl', ['CompareValues', 'CompareService', CompareCtrl]
