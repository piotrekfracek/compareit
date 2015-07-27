class ConfigureMenuService
  constructor: (@ConfigureMenuValues) ->

  isVertical:   -> @ConfigureMenuValues.configuration.orientation is 'vertical'
  isHorizontal: -> @ConfigureMenuValues.configuration.orientation is 'horizontal'
  getOrientation: -> @ConfigureMenuValues.configuration.orientation

  getX1: -> @ConfigureMenuValues.configuration.x1
  getY1: -> @ConfigureMenuValues.configuration.y1
  getX2: -> @ConfigureMenuValues.configuration.x2
  getY2: -> @ConfigureMenuValues.configuration.y2
  getScale1: -> @ConfigureMenuValues.configuration.scale1
  getScale2: -> @ConfigureMenuValues.configuration.scale2

  setOrientation: (orientation) -> @ConfigureMenuValues.configuration.orientation = orientation

  cloneConfiguration: ->
    @ConfigureMenuValues.cloneConfiguration = Object.clone(@ConfigureMenuValues.configuration, true)

  cloneDefaultConfiguration: ->
    @ConfigureMenuValues.defaultConfiguration = Object.clone(@ConfigureMenuValues.configuration, true)

  restoreConfiguration: ->
    @ConfigureMenuValues.configuration = @ConfigureMenuValues.cloneConfiguration

  restoreDefaultConfiguration: ->
    @ConfigureMenuValues.configuration = Object.clone(@ConfigureMenuValues.defaultConfiguration, true)

  setConfiguration: (newConfig) ->
    @ConfigureMenuValues.configuration = newConfig

createConfigureMenuService = (ConfigureMenuValues) ->
  new ConfigureMenuService ConfigureMenuValues

angular.module('Compareit').factory 'ConfigureMenuService', ['ConfigureMenuValues', createConfigureMenuService]
