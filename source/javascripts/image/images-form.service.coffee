class ImagesFormService

  constructor: (@ConfigureMenuService, @CompareService, @$state, @UrlService) ->

  imagesFormSubmit: ({@firstImage, @secondImage}) ->
    @CompareService.disableCompare()
    @$state.go 'main.compare',
      image1:      @UrlService.escapeImageUrl @firstImage
      image2:      @UrlService.escapeImageUrl @secondImage
      orientation: @UrlService.escapeOrientation @ConfigureMenuService.getOrientation()
      x1: '-100'
      y1: '50'
      scale1: '1,4'
      x2: '-100'
      y2: '50'
      scale2: '1,4'

createImagesFormService = (ConfigureMenuService, CompareService, $state, UrlService) ->
  new ImagesFormService ConfigureMenuService, CompareService, $state, UrlService

angular.module('Compareit').factory 'ImagesFormService', ['ConfigureMenuService', 'CompareService', '$state', 'UrlService', createImagesFormService]
