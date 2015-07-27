class DataService
  constructor: (@ConfigureMenuService, @ImagesService) ->

  loadImages: ({@firstImage, @secondImage}) ->
    @ImagesService.loadImages
      firstImage:  @firstImage
      secondImage: @secondImage

  setOrientation: (orientation) -> @ConfigureMenuService.setOrientation orientation

createDataService = (ConfigureMenuService, ImagesService) ->
  new DataService(ConfigureMenuService, ImagesService)

angular.module('Compareit').factory 'DataService',['ConfigureMenuService', 'ImagesService', createDataService]
