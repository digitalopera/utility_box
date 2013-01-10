#= require utility_box/utility_box_namespace

# @method parameterizeObject
# data [Object]
# Generate correctly formatted parameters for xhr2
#
# {
#   id: 1234567890,
#   person: {
#     first_name: 'Grant',
#     last_name : 'Klinsing',
#     meta : {
#       foo: 'bar',
#       test: [100, 200]
#     }
#   }
# }
#
# Will become:
#
# id = 1234567890
# person[first_name] = 'Grant'
# person[last_name] = 'Klinsing'
# person[meta][foo] = 'bar'
# person[meta][test] = [100, 200]
window.utilityBox.parameterizeObject = (data) ->
  obj = {}

  accLoop = (key, val) ->
    if $.isPlainObject val
      for k, v of val
        k = "#{key}[#{k}]"
        accLoop(k, v)
    else
      obj[key] = val
    return

  for key, val of data
    accLoop(key, val)

  obj

# @method serializeForm
# form [element|jQuery Element]
window.utilityBox.serializeForm = (form) ->
  obj = {}
  # if jQuery, break it down
  form = form[0] if form.jquery
  $.makeArray(form.querySelectorAll('input, select, textarea')).forEach (input) ->
    if input.type == 'file'
      obj[input.name] = input.files[0]
    else
      obj[input.name] = input.value

  # remove properites that are undefined
  for key, val of obj
    if val == undefined
      delete obj[key]

  obj

$(document).ready () ->
  $('[data-is="datepicker"]').datepicker()