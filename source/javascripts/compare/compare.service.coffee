class CompareService
  constructor: (@CompareValues, @ConfigureMenuValues, @ConfigureMenuService, @UrlService) ->

  getOrientation:   -> @ConfigureMenuValues.configuration.orientation

  isCompareEnabled: -> @CompareValues.isCompareEnabled
  enableCompare:    -> @CompareValues.isCompareEnabled = true
  enableCompareAndRestore: ->
    @ConfigureMenuService.restoreConfiguration()
    @CompareValues.isCompareEnabled = true
  disableCompare:   ->
    @CompareValues.isCompareEnabled = false
    @ConfigureMenuService.cloneConfiguration()
  enableCompareAndUpdateUrl: ->
    @CompareValues.isCompareEnabled = true
    @UrlService.updateUrl {}

  backLandingWithReload: -> @UrlService.backLandingWithReload()

createCompareService = (CompareValues, ConfigureMenuValues, ConfigureMenuService, UrlService) ->
  new CompareService CompareValues, ConfigureMenuValues, ConfigureMenuService, UrlService

angular.module('Compareit').factory 'CompareService', ['CompareValues', 'ConfigureMenuValues', 'ConfigureMenuService', 'UrlService', createCompareService]
