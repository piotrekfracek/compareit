class UrlService
  constructor: (@DataService) ->

  escapeImageUrl: (url) ->
    url.escapeURL(true).replace(/\./g, '&#46')
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

  readDataFromUrl: ($stateParams)->
    @DataService.loadImages
      firstImage:  @unescapeImageUrl $stateParams.image1
      secondImage: @unescapeImageUrl $stateParams.image2
    @DataService.setOrientation @unescapeOrientation $stateParams.orientation

createUrlService = (DataService) ->
  new UrlService(DataService)

angular.module('Compareit').factory 'UrlService',['DataService', createUrlService]
