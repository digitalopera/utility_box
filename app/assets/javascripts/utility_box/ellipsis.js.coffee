
# Animate an ellipsis witin elements with the attribute 'data-animate="ellipsis"'
# Frame 1 .
# Frame 2 ..
# Frame 3 ...
# Frame 4 .
# Etc..
$(document).ready () ->
  $('[data-animate="ellipsis"]').each (idx, ele) ->
    ellipsis  = $ ele
    counter   = 0
    timer     = setInterval () ->
      counter++
      counter = 0 if counter > 3
      num     = 0
      arr     = []
      while num < counter
        num++
        arr.push '.'

      ellipsis.text arr.join('')
    , 750