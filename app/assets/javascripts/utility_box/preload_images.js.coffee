#= require utility_box/utility_box_namespace

# @method preloadImages
# urls [String, Array]
# callback [Function]
# callback fired when all images have loaded
window.utilityBox.preloadImages = (urls, callback) ->
  urls = [urls] if typeof urls == 'string'
  images = []
  loaded = 0
  increment = ->
    loaded++
    if callback? && loaded == urls.length
      callback()
  urls.forEach (url, i) ->
    img = images[i]
    img = new Image()
    # we want to increment on each of these events
    img.onload = increment
    img.onerror = increment
    img.onabort = increment
    img.src = url