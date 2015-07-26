class ImagesFormService

  constructor: (@ImagesFormValues, @CompareService, @$state, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesFormValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesFormValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @loadImages(firstImage: @firstImage, secondImage: @secondImage).then =>
      @CompareService.toggleCompare()
      @$state.go 'main.compare'

createImagesFormService = (ImagesFormValues, CompareService, $state, $q) ->
  new ImagesFormService ImagesFormValues, CompareService, $state, $q

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', 'CompareService', '$state', '$q', createImagesFormService]
