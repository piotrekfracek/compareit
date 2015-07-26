class ConfigureMenuService
  constructor: (@ConfigureMenuValues) ->

  isVertical:   -> @ConfigureMenuValues.orientation is 'vertical'
  isHorizontal: -> @ConfigureMenuValues.orientation is 'horizontal'

  setOrientation: (orientation) -> @ConfigureMenuValues.orientation = orientation

createConfigureMenuService = (ConfigureMenuValues) ->
  new ConfigureMenuService ConfigureMenuValues

angular.module('Compareit').factory 'ConfigureMenuService', ['ConfigureMenuValues', createConfigureMenuService]
