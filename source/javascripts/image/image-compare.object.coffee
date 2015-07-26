class ImageCompare

  constructor: ({@url, @id}) ->
    @width  = undefined
    @height = undefined
    @object = undefined

  _createImage: (url) ->
    deferred = app.global.$q.defer()
    loadImage url, (img) =>
      if img.type is "error"
        @_onCreateImageError url, img
        deferred.reject(img)
      else
        @object = img
        @width  = img.width
        @height = img.height
        deferred.resolve(@)
    deferred.promise

  _onCreateImageError: (url, imageObject) ->
    console.log "Error loading image " + url

  appendTo: (to) -> $(@object).appendTo to


  @create: ({@url, @id}) ->
    imageCompareObject = new @ url: @url, id: @id
    promise = imageCompareObject._createImage(@url)
    promise
