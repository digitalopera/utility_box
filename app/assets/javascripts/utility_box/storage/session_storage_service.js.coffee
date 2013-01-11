###
# UtilityBox.Storage.SessionStorageService
#
# Brought to you by the folks at Digital Opera, LLC
# www.digitalopera.com
# ======================================================
# Provides a simple interface for working with the new session storage
# options made available with HTML5
#
# http://www.w3schools.com/html/html5_webstorage.asp
#
#= require ./namespace
###
@UtilityBox.Storage = window.UtilityBox.Storage || {}

class @UtilityBox.Storage.SessionStorageService
  constructor : (id, storName) ->
    @id     = id
    @storName   = storName
    @data     = null
    @started  = false

  start : () ->
    return @raise_not_supported_exception() unless window.sessionStorage
    try
      unless sessionStorage.getItem(@id)
        _temp = {}
        _temp[@storName]
        sessionStorage.setItem(@storName, JSON.stringify(_temp))

      _temp = JSON.parse sessionStorage.getItem(@id)
      _temp[@storName] = {} unless _temp[@storName]

      @data = _temp[@storName]
      @started = true
    catch e
      @started = false

  commit : () ->
    return @raise_not_started_exception() unless @started
    try
      _temp         = JSON.parse sessionStorage.getItem(@id)
      _temp[@storName]  = @data
      sessionStorage.setItem @id, JSON.stringify(_temp)
      return true
    catch e
      return false

  set : (key, value, autoCommit = false) ->
    return @raise_not_started_exception() unless @started
    try
      @data[key] = value
      @commit() if autoCommit
      return true
    catch e
      return false

  get : (key) ->
    return @raise_not_started_exception() unless @started
    @data[key]

  remove : (key, autoCommit = false) ->
    return @raise_not_started_exception() unless @started
    try
      delete @data[key]
      @commit() if autoCommit
      return true
    catch e
      return false

  raise_not_started_exception : () ->
    console.log('service has not been started...') if console

  raise_not_supported_exception : () ->
    console.log('session storage is not supported by your browser.') if console