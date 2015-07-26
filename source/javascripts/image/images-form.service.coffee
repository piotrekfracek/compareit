class ImagesFormService

  constructor: (@ImagesFormValues, @$state, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesFormValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesFormValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @loadImages(firstImage: @firstImage, secondImage: @secondImage).then =>
      @$state.go 'main.compare'

createImagesFormService = (ImagesFormValues, $state, $q) ->
  new ImagesFormService ImagesFormValues, $state, $q

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', '$state', '$q', createImagesFormService]
