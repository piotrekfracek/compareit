class HeaderCtrl

  constructor: (@HeaderValues, @HeaderService) ->
    @openConfigure()

  isConfigureVisible: -> @HeaderValues.isConfigureVisible

  openConfigure:  -> @HeaderService.setConfigureVisibility true
  closeConfigure: -> @HeaderService.setConfigureVisibility false


angular
  .module 'Compareit'
  .controller 'HeaderCtrl', ['HeaderValues', 'HeaderService', HeaderCtrl]
