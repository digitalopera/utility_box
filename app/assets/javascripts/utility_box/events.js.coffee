#= require utility_box/utility_box_namespace

# @method isClickOutsideElement
# event [Event]
# element [DOM Element]
# Determines whether or not a click is outside of the element passed in
window.utilityBox.isClickOutsideElement = (event, element) ->
  target = $ event.target

  if target[0] == element[0] || element.children(target).length > 0
    return false
  else
    return true