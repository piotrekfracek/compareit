class ImageCompare

  constructor: ({@url}) ->
    @width  = 0
    @height = 0
    @object = @createImage @url

  createImage: (url) ->
    image = new Image()
    image.src = url
    $(image).one 'load', =>
      @width  = $(this).width
      @height = $(this).height
    image
