class DataService
  constructor: (@ConfigureMenuService, @ImagesService) ->

  loadImages: ({@firstImage, @secondImage}) ->
    @ImagesService.loadImages
      firstImage:  @firstImage
      secondImage: @secondImage

  setConfiguration: (newConfig) ->
    @ConfigureMenuService.setConfiguration newConfig

  cloneDefaultConfiguration:   -> @ConfigureMenuService.cloneDefaultConfiguration()
  restoreDefaultConfiguration: -> @ConfigureMenuService.restoreDefaultConfiguration()

createDataService = (ConfigureMenuService, ImagesService) ->
  new DataService(ConfigureMenuService, ImagesService)

angular.module('Compareit').factory 'DataService',['ConfigureMenuService', 'ImagesService', createDataService]
