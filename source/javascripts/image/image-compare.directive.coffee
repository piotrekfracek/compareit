angular.module('Compareit').directive 'imageCompare', [ 'CompareService', 'ConfigureMenuService', (CompareService, ConfigureMenuService) ->

  scope:
    imageCompareShowDimness: '='

  templateUrl: '/templates/compare/comparator.html'

  link: (scope, element, attrs) ->

    imageFront = $(attrs.imageCompareSelector)

    element.mousemove (e) ->
      offY = Math.floor(e.offsetY)
      offX = Math.floor(e.offsetX)

      if CompareService.isCompareEnabled()

        if ConfigureMenuService.isVertical()
          imageFront.css
            height: "#{offY}px"
            width: "100%"

        else
          imageFront.css
            width: "#{offX}px"
            height: "100%"
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
