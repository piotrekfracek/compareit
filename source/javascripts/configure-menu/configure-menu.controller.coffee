class ConfigureMenuCtrl

  constructor: (@ConfigureMenuValues) ->

  isVertical: ->  @ConfigureMenuValues.isVertical

  isHorizontal: -> @ConfigureMenuValues.isHorizontal

  toggleVertical: (@event) ->
    @ConfigureMenuValues.isVertical     = true
    @ConfigureMenuValues.isHorizontal   = false
    @ConfigureMenuValues.orientation    = 'height'
    @ConfigureMenuValues.mouseDirection = Math.floor(event.offsetY)

  toggleHorizontal: (@event) ->
    @ConfigureMenuValues.isHorizontal   = true
    @ConfigureMenuValues.isVertical     = false
    @ConfigureMenuValues.orientation    = 'width'
    @ConfigureMenuValues.mouseDirection = Math.floor(event.offsetX)

  orientation: -> @ConfigureMenuValues.orientation

  mouseDirection: -> @ConfigureMenuValues.mouseDirection

angular
  .module 'Compareit'
  .controller 'ConfigureMenuCtrl', ['ConfigureMenuValues', ConfigureMenuCtrl]
