class ImagesFormService

  constructor: (@ImagesFormValues, @$state, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesFormValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesFormValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
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

createImagesFormService = (ImagesFormValues, $state, $q) ->
  new ImagesFormService ImagesFormValues, $state, $q

angular.module('Compareit').factory 'ImagesFormService', ['ImagesFormValues', '$state', '$q', createImagesFormService]
