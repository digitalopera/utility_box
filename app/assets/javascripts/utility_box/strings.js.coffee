#= require utility_box/namespace

# @method titleize
# str [String]
# Titleize a string
@UtilityBox.titleize = (str) ->
  str.charAt(0).toUpperCase() + str.slice(1)

# @method formatJSONErrors
# str [String, Object]
# withKeys [Boolean]
# Takes a JSON object and convert it to a readable sentence
#
# Example:
# {email: ["must be at least 6 characters","must contain a number and a letter"]}
# will be translated to:
# ["email must be at least 6 characters and must contain a number and a letter"]
@UtilityBox.formatJSONErrors = (str, withKeys) ->
  errors = if typeof str == 'string' then JSON.parse(str) else str
  $.map errors, (val, key) ->
    values = val.join(' and ')
    str = window.utilityBox.titleize "#{key} #{values}"

    if withKeys?
      obj = {}
      obj[key] = str
      obj
    else
      str