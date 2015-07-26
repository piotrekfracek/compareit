class ImagesCtrl

  constructor: (@ImagesService, @$scope) ->

  imagesFormSubmit: ->
    @ImagesService.imagesFormSubmit
      firstImage:  @$scope.firstImageUrl
      secondImage: @$scope.secondImageUrl

angular
  .module 'Compareit'
  .controller 'ImagesCtrl', ['ImagesService', '$scope', ImagesCtrl]
