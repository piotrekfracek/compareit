class ImagesFormService

  constructor: (@$scope, @ImagesFormValues, @$state) ->

  loadImages: ->
    @ImagesFormValues.firstImage  = new ImageCompare url: firstImage
    @ImagesFormValues.secondImage = new ImageCompare url: secondImage

  imagesFormSubmit: (@$scope) ->
    @loadImages
      firstImage:  @$scope.firstImageUrl
      secondImage: @$scope.secondImageUrl
    @$state.go 'main.compare'

createImagesFormService = (ImagesFormValues) ->
  new ImagesFormService ImagesFormValues

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', createImagesFormService]
