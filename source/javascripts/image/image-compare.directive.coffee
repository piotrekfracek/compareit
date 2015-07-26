angular.module('Compareit').directive 'imageCompare', [ 'ConfigureMenuService', (ConfigureMenuService) ->

  scope:
    imageCompareShowDimness: '='
    isCompareEnabled:        '='
    imageOrientation:        '='

  templateUrl: '/templates/compare/comparator.html'

  link: (scope, element, attrs) ->

    imageFront = $(attrs.imageCompareSelector)

    setCssForComparation = (offX, offY) ->
      if scope.imageOrientation is 'vertical'
        imageFront.css
          height: "#{offY}px"
          width:  "100%"
      else
        imageFront.css
          width:  "#{offX}px"
          height: "100%"

    setCssForConfiguration = ->
      if scope.imageOrientation is 'vertical'
        imageFront.css
          height: "50%"
          width: "100%"
      else
        imageFront.css
          width: "50%"
          height: "100%"

    element.mousemove (e) ->
      offY = Math.floor(e.offsetY)
      offX = Math.floor(e.offsetX)
      setCssForComparation(offX, offY) if scope.isCompareEnabled

    scope.$watch 'isCompareEnabled', (isCompareEnabled) =>
      setCssForConfiguration() unless isCompareEnabled

    scope.$watch 'imageOrientation', (imageOrientation) =>
      console.log imageOrientation
      setCssForConfiguration() unless scope.isCompareEnabled

    setCssForConfiguration()

    ###
     $(document).keypress (e) ->
       if e.which is 83 or 13
           element.mousedown ->
             $(window).mousemove (event) ->
               console.log "#{Math.floor(event.offsetY)}px"
               imageFront.css 'height': "#{Math.floor(event.offsetY)}px",
                              'width': "#{Math.floor(event.offsetX)}px"
           element.mouseup ->
             $(window).unbind "mousemove"
           console.log 'pushed!'
     ###
]
