class HeaderCtrl

  constructor: (@HeaderMenuValues, @ConfigureMenuValues) ->

  isConfigureVisible: -> @HeaderMenuValues.isConfigureVisible

  toggleConfigure:    ->
    @HeaderMenuValues.isConfigureVisible = !@HeaderMenuValues.isConfigureVisible
    @ConfigureMenuValues.isCompareEnabled  = !@ConfigureMenuValues.isCompareEnabled

angular
  .module 'Compareit'
  .controller 'HeaderCtrl', ['HeaderValues', 'ConfigureMenuValues', HeaderCtrl]
