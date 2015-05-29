angular.module('Compareit').directive 'comparator', ->

  link: (scope, element, attrs) ->
    imageFront = $('.image-container--front')

    element.mousemove (event) ->
      imageFront.css 'height', "#{Math.floor(event.offsetY)}px"
