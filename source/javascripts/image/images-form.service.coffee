class ImagesFormService

  constructor: (@ImagesFormValues, @$state) ->

  loadImages: ({@firstImage, @secondImage}) ->
    @ImagesFormValues.firstImage  = new ImageCompare url: @firstImage
    @ImagesFormValues.secondImage = new ImageCompare url: @secondImage

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @loadImages
      firstImage:  @firstImage
      secondImage: @secondImage
    @$state.go 'main.compare'

createImagesFormService = (ImagesFormValues, $state) ->
  new ImagesFormService ImagesFormValues, $state

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', '$state', createImagesFormService]
