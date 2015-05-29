class NormalHeaderCtrl

  constructor: (@NormalHeaderValues) ->
    
  isVertical: ->  @NormalHeaderValues.isVertical

  isHorizontal: -> @NormalHeaderValues.isHorizontal

  toggleVertical: ->
    @NormalHeaderValues.isVertical = true
    @NormalHeaderValues.isHorizontal = false

  toggleHorizontal: ->
    @NormalHeaderValues.isHorizontal = true
    @NormalHeaderValues.isVertical = false

angular
  .module 'Compareit'
  .controller 'NormalHeaderCtrl', ['NormalHeaderValues', NormalHeaderCtrl]
