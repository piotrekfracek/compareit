class ImagesFormService

  constructor: (@ImagesFormValues, @CompareService, @$state, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesFormValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesFormValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @CompareService.toggleCompare()
    @$state.go 'main.compare',
      image1: 'test'
      image2: 'test2'
      orientation: 'h'
      x1: '-100'
      y1: '50'
      scale1: '1,4'
      x2: '-100'
      y2: '50'
      scale2: '1,4'

createImagesFormService = (ImagesFormValues, CompareService, $state, $q) ->
  new ImagesFormService ImagesFormValues, CompareService, $state, $q

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', 'CompareService', '$state', '$q', createImagesFormService]
