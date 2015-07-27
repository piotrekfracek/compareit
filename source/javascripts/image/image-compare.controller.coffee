class ImageCompareCtrl

  constructor: (@$scope) ->

  getMousePosition: (e) ->
    x: Math.floor(e.offsetX)
    y: Math.floor(e.offsetY)

  calculatePositionDiff: (pos1, pos2) ->
    x: pos2.x - pos1.x
    y: pos2.y - pos1.y

  getDimensionsRatio: ->
    maxWidth = Math.max(@$scope.firstImage.width, @$scope.secondImage.width)
    maxHeight = switch maxWidth
      when @$scope.firstImage.width then @$scope.firstImage.height
      when @$scope.secondImage.width then @$scope.secondImage.height
    maxHeight / maxWidth * 100

  onDrag: (event) =>
    mousedownPosition = @getMousePosition event.data.eDown
    mousemovePosition = @getMousePosition event
    diff = @calculatePositionDiff mousedownPosition, mousemovePosition
    @changeBackgroundPosition(diff, event.data.element)

  changeBackgroundPosition: (diff, element) ->
    element.css
      backgroundPosition: "#{diff.x}px #{diff.y}px"

  setCssForComparation: (image, offX, offY) ->
    if @$scope.imageOrientation is 'vertical'
      image.css
        height: "#{offY}px"
        width:  "100%"
    else
      image.css
        width:  "#{offX}px"
        maxWidth: "#{@$scope.firstImage.width}px"
        height: "100%"

  setCssForConfiguration: (image) ->
    if @$scope.imageOrientation is 'vertical'
      image.css
        height: "50%"
        width: "100%"
    else
      image.css
        width: "50%"
        height: "100%"

angular
  .module 'Compareit'
  .controller 'ImageCompareCtrl', [ '$scope', ImageCompareCtrl ]
