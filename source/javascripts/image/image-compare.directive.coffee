angular.module('Compareit').directive 'imageCompare', ->

  controller: 'ConfigureMenuCtrl as configureCtrl'

  link: (scope, element, attrs, ctrl) ->
    imageFront = $('.image-container--front')

    element.mousemove (e) ->
      offY = Math.floor(e.offsetY)
      offX = Math.floor(e.offsetX)

      if ctrl.mouseDirection() is 'Y'
        imageFront.css 'height': "#{offY}px"
        element.mouseleave (e) ->
          imageFront.css 'height': "100%"

      else
        imageFront.css 'width': "#{offX}px"
        element.mouseleave (e) ->
          imageFront.css 'width': "100%"
    # $(document).keypress (e) ->
    #   if e.which is 83 or 13
          # element.mousedown ->
          #   $(window).mousemove (event) ->
          #     console.log "#{Math.floor(event.offsetY)}px"
          #     imageFront.css 'height': "#{Math.floor(event.offsetY)}px",
          #                    'width': "#{Math.floor(event.offsetX)}px"
          # element.mouseup ->
          #   $(window).unbind "mousemove"
          # console.log 'pushed!'
