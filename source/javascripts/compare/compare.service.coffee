class CompareService
  constructor: (@CompareValues, @ConfigureMenuValues) ->

  getOrientation:   -> @ConfigureMenuValues.orientation

  toggleCompare:    -> @CompareValues.isCompareEnabled = !@CompareValues.isCompareEnabled
  isCompareEnabled: -> @CompareValues.isCompareEnabled

createCompareService = (CompareValues, ConfigureMenuValues) ->
  new CompareService CompareValues, ConfigureMenuValues

angular.module('Compareit').factory 'CompareService', ['CompareValues', 'ConfigureMenuValues', createCompareService]
