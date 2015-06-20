class ImagesFormCtrl

  constructor: (@ImagesFormService) ->

  loadImages:       -> @ImagesFormService.loadImages()

  imagesFormSubmit: -> @ImagesFormService.imagesFormSubmit()

angular
  .module 'Compareit'
  .controller 'ImagesFormCtrl', ['ImagesFormService', ImagesFormCtrl]
