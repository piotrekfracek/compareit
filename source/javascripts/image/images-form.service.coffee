class ImagesFormService

  constructor: (@CompareService, @UrlService) ->

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @CompareService.disableCompare()
    @UrlService.updateUrl
      image1:      @firstImage
      image2:      @secondImage
    , true

createImagesFormService = (CompareService, UrlService) ->
  new ImagesFormService CompareService, UrlService

angular.module('Compareit').factory 'ImagesFormService', ['CompareService', 'UrlService', createImagesFormService]
