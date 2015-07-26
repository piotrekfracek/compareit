class CompareCtrl

  constructor: (@CompareValues, @CompareService, @ImagesService) ->

  getOrientation:   -> @CompareService.getOrientation()

  enableCompare:           -> @CompareService.enableCompare()
  enableCompareAndRestore: -> @CompareService.enableCompareAndRestore()
  disableCompare:          -> @CompareService.disableCompare()
  isCompareEnabled:        -> @CompareService.isCompareEnabled()

  getFirstImageUrl:        -> @ImagesService.getFirstImageUrl()
  getSecondImageUrl:       -> @ImagesService.getSecondImageUrl()

angular
  .module 'Compareit'
  .controller 'CompareCtrl', ['CompareValues', 'CompareService', 'ImagesService', CompareCtrl]
