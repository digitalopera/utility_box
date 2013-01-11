###
# UtilityBox.Animation.Ellipsis
#
# Brought to you by the folks at Digital Opera, LLC
# www.digitalopera.com
# ======================================================
# Animate an ellipsis witin elements with the attribute 'data-animate="ellipsis"'
# Frame 1 .
# Frame 2 ..
# Frame 3 ...
# Frame 4 .
# Etc..
# ======================================================
# Requires jQuery 1.8.x+
#
#= require ./namespace
###
$ = jQuery

@UtilityBox.Animation.Ellipsify = (element, options) ->
  @options  = options
  @ele      = element

  @animate()
  return @

@UtilityBox.Animation.Ellipsify.prototype =
  constructor : @UtilityBox.Animation.Ellipsify

  animate : () ->
    counter = 0
    timer   = setInterval () ->
      counter++
      counter = 0 if counter > 3
      num     = 0
      arr     = []
      while num < counter
        num++
        arr.push '.'

        @ele.text arr.join('')
    , 750

# jQuery Plugin Definition
$.fn.ellipsify = () ->
  return @each () ->
    $this = @
    data  = $this.data('ellipsify')
    options = $.extend {}, $.fn.ellipsify.defaults, $this.data(), typeof option == 'object' && local(options)

    $this.data('ellipsify', (data = new @UtilityBox.Animation.Ellipsify($this))) if !data

$.fn.ellipsify.Constructor = Ellipsify

# Markup Bindings
$(document).ready () ->
  $('[data-animate=ellipsis]').each (idx, ele) ->
    $(ele).ellipsify()

  return true