class ConfigureMenuCtrl

  constructor: (@ConfigureMenuService) ->

  isVertical:       -> @ConfigureMenuService.isVertical()
  isHorizontal:     -> @ConfigureMenuService.isHorizontal()

  toggleVertical:   -> @ConfigureMenuService.setOrientation 'vertical'
  toggleHorizontal: -> @ConfigureMenuService.setOrientation 'horizontal'

  restoreConfiguration: -> @ConfigureMenuService.restoreConfiguration()

angular
  .module 'Compareit'
  .controller 'ConfigureMenuCtrl', ['ConfigureMenuService', ConfigureMenuCtrl]
