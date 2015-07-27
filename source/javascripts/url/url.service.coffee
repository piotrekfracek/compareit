class UrlService
  constructor: (@DataService, @$state, @ConfigureMenuService, @ImagesService) ->

  escapeImageUrl: (url) ->
    url.escapeURL(true).replace(/\./g, '&#46') unless url is undefined
  unescapeImageUrl: (url) ->
    url.replace(/&#46/g, '.').unescapeURL()

  escapeOrientation: (orientation) ->
    switch orientation
      when 'horizontal' then 'h'
      when 'vertical'   then 'v'
  unescapeOrientation: (orientation) ->
    switch orientation
      when 'h' then 'horizontal'
      when 'v' then 'vertical'

  escapeNumber:   (number) -> "#{number}".replace(/\./g,',')
  unescapeNumber: (number) -> "#{number}".replace(/\,/g,'.')

  readDataFromUrl: ($stateParams)->
    @DataService.cloneDefaultConfiguration()
    @DataService.loadImages
      firstImage:  @unescapeImageUrl $stateParams.image1
      secondImage: @unescapeImageUrl $stateParams.image2
    @DataService.setConfiguration
      orientation: @unescapeOrientation $stateParams.orientation
      x1:          @unescapeNumber $stateParams.x1
      x2:          @unescapeNumber $stateParams.x2
      scale1:      @unescapeNumber $stateParams.scale1
      y1:          @unescapeNumber $stateParams.y1
      y2:          @unescapeNumber $stateParams.y2
      scale2:      @unescapeNumber $stateParams.scale2

  updateUrl: (params, reload=false) ->
    preparedParams =
      image1:      @escapeImageUrl params.image2         or @ImagesService.getSecondImageUrl()
      image2:      @escapeImageUrl params.image1         or @ImagesService.getFirstImageUrl()
      orientation: @escapeOrientation params.orientation or @ConfigureMenuService.getOrientation()
      x1:          @escapeNumber params.x1               or @ConfigureMenuService.getX1()
      y1:          @escapeNumber params.y1               or @ConfigureMenuService.getY1()
      scale1:      @escapeNumber params.scale1           or @ConfigureMenuService.getScale1()
      x2:          @escapeNumber params.x2               or @ConfigureMenuService.getX2()
      y2:          @escapeNumber params.y2               or @ConfigureMenuService.getY2()
      scale2:      @escapeNumber params.scale2           or @ConfigureMenuService.getScale2()
    @$state.go 'main.compare', preparedParams, notify: reload

  backLandingWithReload: () ->
    @$state.go 'main.landing', {}, reload: true
    @DataService.restoreDefaultConfiguration()

createUrlService = (DataService, $state, ConfigureMenuService, ImagesService) ->
  new UrlService(DataService, $state, ConfigureMenuService, ImagesService)

angular.module('Compareit').factory 'UrlService',['DataService', '$state', 'ConfigureMenuService', 'ImagesService', createUrlService]
