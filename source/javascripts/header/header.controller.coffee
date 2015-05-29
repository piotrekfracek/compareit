class HeaderCtrl

  constructor: (@HeaderMenuValues) ->

  isConfigureVisible: -> @HeaderMenuValues.isConfigureVisible

  toggleConfigure:    -> @HeaderMenuValues.isConfigureVisible = !@HeaderMenuValues.isConfigureVisible

angular
  .module 'Compareit'
  .controller 'HeaderCtrl', ['HeaderValues', HeaderCtrl]
