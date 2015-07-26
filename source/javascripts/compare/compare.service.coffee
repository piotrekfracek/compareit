class CompareService
  constructor: (@CompareValues) ->

  toggleCompare:    -> @CompareValues.isCompareEnabled = !@CompareValues.isCompareEnabled
  isCompareEnabled: -> @CompareValues.isCompareEnabled

createCompareService = (CompareValues) ->
  new CompareService CompareValues

angular.module('Compareit').factory 'CompareService', ['CompareValues', createCompareService]
