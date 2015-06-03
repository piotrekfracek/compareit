class HeaderService
  constructor: (@HeaderValues, @ConfigureMenuValues) ->

  setConfigureVisibility: (val) ->
    @HeaderValues.isConfigureVisible   = val
    @ConfigureMenuValues.isCompareEnabled  = not val

createHeaderService = (HeaderValues, ConfigureMenuValues) ->
  new HeaderService HeaderValues, ConfigureMenuValues

angular.module('Compareit').factory 'HeaderService', ['HeaderValues', 'ConfigureMenuValues', createHeaderService]
