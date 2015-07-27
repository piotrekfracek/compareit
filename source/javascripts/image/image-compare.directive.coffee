angular.module('Compareit').directive 'imageCompare', [ 'ConfigureMenuService', '$document', (ConfigureMenuService, $document) ->

  scope:
    isCompareEnabled: '='
    imageOrientation: '='
    firstImage: '='
    secondImage: '='

  templateUrl: '/templates/compare/comparator.html'
  controller: 'ImageCompareCtrl'

  link: (scope, element, attrs, imageCompareCtrl) ->

    imageFront = $(attrs.imageCompareSelector)

    element.on 'mousedown', (eDown) -> element.on 'mousemove', {eDown: eDown, element: imageFront}, imageCompareCtrl.onDrag
    element.on 'mouseup',           -> element.off 'mousemove', imageCompareCtrl.onDrag

    element.mousemove (e) ->
      {x, y} = imageCompareCtrl.getMousePosition(e)
      imageCompareCtrl.setCssForComparation(imageFront, x, y) if scope.isCompareEnabled

    scope.$watch 'isCompareEnabled', (isCompareEnabled) =>
      imageCompareCtrl.setCssForConfiguration(imageFront) unless isCompareEnabled

    scope.$watch 'imageOrientation', (imageOrientation) =>
      imageCompareCtrl.setCssForConfiguration(imageFront) unless scope.isCompareEnabled

    imageCompareCtrl.setCssForConfiguration(imageFront)

]
