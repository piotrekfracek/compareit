class ImagesFormService

  constructor: (@ImagesFormValues, @$state) ->

  loadImages: ({@firstImage, @secondImage}) ->
    @ImagesFormValues.firstImage  = new ImageCompare url: @firstImage,  id: 0
    @ImagesFormValues.secondImage = new ImageCompare url: @secondImage, id: 1

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @loadImages
      firstImage:  @firstImage
      secondImage: @secondImage
    @$state.go 'main.compare'

createImagesFormService = (ImagesFormValues, $state) ->
  new ImagesFormService ImagesFormValues, $state

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', '$state', createImagesFormService]
