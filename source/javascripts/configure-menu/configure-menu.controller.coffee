class ConfigureMenuCtrl

  constructor: (@ConfigureMenuService) ->

  isVertical:       -> @ConfigureMenuService.isVertical()
  isHorizontal:     -> @ConfigureMenuService.isHorizontal()

  toggleVertical:   -> @ConfigureMenuService.setOrientation 'vertical'
  toggleHorizontal: -> @ConfigureMenuService.setOrientation 'horizontal'

  isCompareEnabled: -> @ConfigureMenuService.isCompareEnabled()

angular
  .module 'Compareit'
  .controller 'ConfigureMenuCtrl', ['ConfigureMenuService', ConfigureMenuCtrl]
