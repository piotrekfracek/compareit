class ConfigureMenuService
  constructor: (@ConfigureMenuValues) ->

  isVertical:   -> @ConfigureMenuValues.configuration.orientation is 'vertical'
  isHorizontal: -> @ConfigureMenuValues.configuration.orientation is 'horizontal'
  getOrientation: -> @ConfigureMenuValues.configuration.orientation

  setOrientation: (orientation) -> @ConfigureMenuValues.configuration.orientation = orientation

  cloneConfiguration: ->
    @ConfigureMenuValues.cloneConfiguration = Object.clone(@ConfigureMenuValues.configuration, true)

  restoreConfiguration: ->
    @ConfigureMenuValues.configuration = @ConfigureMenuValues.cloneConfiguration

createConfigureMenuService = (ConfigureMenuValues) ->
  new ConfigureMenuService ConfigureMenuValues

angular.module('Compareit').factory 'ConfigureMenuService', ['ConfigureMenuValues', createConfigureMenuService]
