class CompareService
  constructor: (@CompareValues, @ConfigureMenuValues, @ConfigureMenuService) ->

  getOrientation:   -> @ConfigureMenuValues.configuration.orientation

  isCompareEnabled: -> @CompareValues.isCompareEnabled
  enableCompare:    -> @CompareValues.isCompareEnabled = true
  enableCompareAndRestore: ->
    @ConfigureMenuService.restoreConfiguration()
    @CompareValues.isCompareEnabled = true
  disableCompare:   ->
    @CompareValues.isCompareEnabled = false
    @ConfigureMenuService.cloneConfiguration()

createCompareService = (CompareValues, ConfigureMenuValues, ConfigureMenuService) ->
  new CompareService CompareValues, ConfigureMenuValues, ConfigureMenuService

angular.module('Compareit').factory 'CompareService', ['CompareValues', 'ConfigureMenuValues', 'ConfigureMenuService', createCompareService]
