angular.module('Compareit').directive 'imageCompare', [ 'ConfigureMenuService', (ConfigureMenuService) ->

  link: (scope, element, attrs) ->
    
    imageFront = $(attrs.imageCompareSelector)

    element.mousemove (e) ->
      offY = Math.floor(e.offsetY)
      offX = Math.floor(e.offsetX)

      if ConfigureMenuService.isCompareEnabled()

        if ConfigureMenuService.isVertical()
          imageFront.css 'height': "#{offY}px"
          # element.mouseleave (e) ->
          #   imageFront.css 'height': "100%"

        else
          imageFront.css 'width': "#{offX}px"
          # element.mouseleave (e) ->
          #   imageFront.css 'width': "100%"
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
