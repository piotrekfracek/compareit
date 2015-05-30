class ConfigureMenuCtrl

  constructor: (@ConfigureMenuValues) ->

  isVertical:       -> @ConfigureMenuValues.isVertical

  isHorizontal:     -> @ConfigureMenuValues.isHorizontal

  isCompareEnabled: -> @ConfigureMenuValues.isCompareEnabled

  toggleVertical:   ->
    @ConfigureMenuValues.isVertical     = true
    @ConfigureMenuValues.isHorizontal   = false
    @ConfigureMenuValues.mouseDirection = 'Y'

  toggleHorizontal: ->
    @ConfigureMenuValues.isHorizontal   = true
    @ConfigureMenuValues.isVertical     = false
    @ConfigureMenuValues.mouseDirection = 'X'

  mouseDirection:   -> @ConfigureMenuValues.mouseDirection

angular
  .module 'Compareit'
  .controller 'ConfigureMenuCtrl', ['ConfigureMenuValues', ConfigureMenuCtrl]
