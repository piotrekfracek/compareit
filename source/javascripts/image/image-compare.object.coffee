class ImageCompare

  constructor: ({@url, @id}) ->
    @width  = undefined
    @height = undefined
    
    @object = @createImage @url
    console.log @

  createImage: (url) ->
    image = loadImage url, (img) =>
      if img.type is "error"
        @onCreateImageError url, img
      else
        @width  = img.width
        @height = img.height
    image

  onCreateImageError: (url, imageObject) ->
    console.log "Error loading image " + url

  appendTo: (to) -> $(@object).appendTo to
