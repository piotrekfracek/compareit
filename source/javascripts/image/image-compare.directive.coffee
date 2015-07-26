angular.module('Compareit').directive 'imageCompare', [ 'ConfigureMenuService', (ConfigureMenuService) ->

  scope:
    imageCompareShowDimness: '='
    isCompareEnabled:        '='
    imageOrientation:        '='

  templateUrl: '/templates/compare/comparator.html'
  controller: 'ImageCompareCtrl'

  link: (scope, element, attrs, imageCompareCtrl) ->

    imageFront = $(attrs.imageCompareSelector)

    # isImageFrontClicked = false
    # mousedownOffsetY = undefined
    # mousedownOffsetX = undefined
    # element
    #   .mousedown (e)->
    #     isImageFrontClicked = true
    #     mousedownOffsetY = Math.floor(e.offsetY)
    #     mousedownOffsetX = Math.floor(e.offsetX)
    #   .mousemove ->
    #     if isImageFrontClicked
    #       console.log mousedownOffsetX
    #   .mouseup ->
    #     isImageFrontClicked = false

    element.mousemove (e) ->
      {x, y} = imageCompareCtrl.getMousePosition(e)
      imageCompareCtrl.setCssForComparation(imageFront, x, y) if scope.isCompareEnabled

    scope.$watch 'isCompareEnabled', (isCompareEnabled) =>
      imageCompareCtrl.setCssForConfiguration(imageFront) unless isCompareEnabled

    scope.$watch 'imageOrientation', (imageOrientation) =>
      console.log imageOrientation
      imageCompareCtrl.setCssForConfiguration(imageFront) unless scope.isCompareEnabled

    imageCompareCtrl.setCssForConfiguration(imageFront)

]
