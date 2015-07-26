class ImagesService

  constructor: (@ImagesValues, @CompareService, @$state, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @CompareService.disableCompare()
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

  getFirstImageUrl:  -> 'fakeUrl' #@ImagesValues.firstImage.url
  getSecondImageUrl: -> 'sndUrl' #@ImagesValues.secondImage.url

createImagesService = (ImagesValues, CompareService, $state, $q) ->
  new ImagesService ImagesValues, CompareService, $state, $q

angular.module('Compareit').factory 'ImagesService', ['ImagesValues', 'CompareService', '$state', '$q', createImagesService]
