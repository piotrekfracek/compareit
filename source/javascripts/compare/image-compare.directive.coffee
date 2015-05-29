angular.module('Compareit').directive 'imageCompare', ->

  link: (scope, element, attrs) ->
    imageFront = $('.image-container--front')

    element.mousemove (event) ->
      imageFront.css 'height', "#{Math.floor(event.offsetY)}px"
