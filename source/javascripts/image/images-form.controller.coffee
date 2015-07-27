class ImagesFormCtrl

  constructor: (@ImagesFormService, @$scope) ->

  imagesFormSubmit: ->
    @ImagesFormService.imagesFormSubmit
      firstImage:  @$scope.firstImageUrl
      secondImage: @$scope.secondImageUrl

angular
  .module 'Compareit'
  .controller 'ImagesFormCtrl', ['ImagesFormService', '$scope', ImagesFormCtrl]
