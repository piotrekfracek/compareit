class CompareCtrl

  constructor: (@CompareValues, @CompareService, @ImagesService) ->

  getOrientation:   -> @CompareService.getOrientation()

  enableCompare:             -> @CompareService.enableCompare()
  enableCompareAndRestore:   -> @CompareService.enableCompareAndRestore()
  enableCompareAndUpdateUrl: -> @CompareService.enableCompareAndUpdateUrl()
  disableCompare:            -> @CompareService.disableCompare()
  isCompareEnabled:          -> @CompareService.isCompareEnabled()

  getFirstImageUrl:        -> @ImagesService.getFirstImageUrl()
  getSecondImageUrl:       -> @ImagesService.getSecondImageUrl()

  getFirstImage:           -> @ImagesService.getFirstImage()
  getSecondImage:          -> @ImagesService.getSecondImage()

  backLandingWithReload:   -> @CompareService.backLandingWithReload()

angular
  .module 'Compareit'
  .controller 'CompareCtrl', ['CompareValues', 'CompareService', 'ImagesService', CompareCtrl]
