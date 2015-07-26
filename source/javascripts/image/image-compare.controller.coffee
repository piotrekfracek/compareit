class ImageCompareCtrl

  constructor: (@$scope) ->

  getMousePosition: (e) ->
    y: Math.floor(e.offsetY)
    x: Math.floor(e.offsetX)

  setCssForComparation: (image, offX, offY) ->
    if @$scope.imageOrientation is 'vertical'
      image.css
        height: "#{offY}px"
        width:  "100%"
    else
      image.css
        width:  "#{offX}px"
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
