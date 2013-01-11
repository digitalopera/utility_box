#= require utility_box/namespace
#= require utility_box/forms

# @class connectionManager
# A simple global interface for ajax calls and handlebars templates
#
# @method get
# resource [Handlebar Template]
# data [Object]
#
# @method post
# resource [Handlebar Template]
# data [Object]
#
# @method put
# resource [Handlebar Template]
# data [Object]
#
# @method destroy
# resource [Handlebar Template]
# data [Object]
#
# Example:
#
# file team_url.hbs
# /api/v1/team/{{id}}
#
# file script.js
# var conn = window.utilityBox.connectionManager()
# conn.get('team_url', {id: 1})
# conn.success(function(data){
#   console.log(data)
# });
class @UtilityBox.connectionManager

  constructor : ->
    # gather tokens for each ajax call
    @apiToken  = $('meta[name="api-token"]').attr('content')
    @csrfToken = $('meta[name="csrf-token"]').attr('content')

    # add progress event to ajax calls
    originalXhr = $.ajaxSettings.xhr
    $.ajaxSetup({
      progress: $.noop
      xhr: ->
        xhr = originalXhr()
        if xhr instanceof window.XMLHttpRequest
          xhr.addEventListener('progress', this.progress, false)

        if xhr.upload
          xhr.upload.addEventListener('progress', this.progress, false)

        xhr.setRequestHeader 'X-CSRF-Token', @csrfToken
        xhr
    })

  get : (resource, data={}) ->
    @_send @_buildParams('GET', resource, data)

  post : (resource, data={}) ->
    @_send @_buildParams('POST', resource, data)

  put : (resource, data={}) ->
    @_send @_buildParams('PUT', resource, data)

  destroy : (resource, data={}) ->
    @_send @_buildParams('DELETE', resource, data)

  _send : (params) ->
    return $.ajax(params)

  _buildParams : (method = 'POST', resource, data={}) ->
    if method == 'GET'
      formData = $.param(data)
    else
      formData = new FormData()
      for key, val of window.utilityBox.parameterizeObject(data)
        formData.append key, val

    params = {
      type        : method
      url         : @buildEndpoint(resource, data)
      username    : 'x'
      password    : @apiToken
      dataType    : 'json'
      data        : formData
      cache       : false,
      contentType : false,
      processData : false
    }

  buildEndpoint : (resource='base_uri', data) ->
    JST["endpoints/#{resource}"](data)