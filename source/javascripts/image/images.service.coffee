class ImagesService

  constructor: (@ImagesValues, @$q) ->

  loadImages: ({@firstImage, @secondImage}) ->
    firstImagePromise  = ImageCompare.create(url: @firstImage,  id: 0)
    firstImagePromise.then  (imageCompareObject) -> @ImagesValues.firstImage  = imageCompareObject
    secondImagePromise = ImageCompare.create(url: @secondImage, id: 1)
    secondImagePromise.then (imageCompareObject) -> @ImagesValues.secondImage = imageCompareObject
    @$q.all [firstImagePromise, secondImagePromise]

  getFirstImageUrl:  -> @ImagesValues.firstImage?.url
  getSecondImageUrl: -> @ImagesValues.secondImage?.url

  getFirstImage:  -> @ImagesValues.firstImage
  getSecondImage: -> @ImagesValues.secondImage

createImagesService = (ImagesValues, $q) ->
  new ImagesService ImagesValues, $q

angular.module('Compareit').factory 'ImagesService', ['ImagesValues', '$q', createImagesService]
