angular.module('Compareit').directive 'imageCompare', ->

  controller: 'ConfigureMenuCtrl as configureCtrl'

  link: (scope, element, attrs, ctrl) ->
    imageFront = $('.image-container--front')
    element.mousemove (event) ->
      imageFront.css "#{ctrl.orientation()}": "#{Math.floor(event.offsetY)}px"
      console.log "#{ctrl.orientation()}, #{ctrl.mouseDirection()}px"
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
