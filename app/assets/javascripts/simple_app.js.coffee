window.SimpleApp = class SimpleApp extends Batman.App

  @title = "Simple App"

  # changed again!
  Batman.config.viewPrefix = 'assets/batman/views'

  # get rid of DOM flicker
  Batman.DOM.Yield.clearAllStale = -> {}

  Batman.config.usePushState = yes
  Batman.config.pathPrefix = '/'

  @resources 'posts', ->
    @resources 'comments'

  @root 'posts#index'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "SimpleApp ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message
