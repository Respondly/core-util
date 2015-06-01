_ = require('lodash')


module.exports =
  ###
  A safe way to test any value as to wheather is is "blank"
  meaning it can be either:
    - null
    - undefined
    - empty-string.
    - empty-array
  ###
  isBlank: (value) ->
    return true if value is null or value is undefined
    return true if _.isArray(value) and _.compact(value).length is 0
    return true if _.isString(value) and _.trim(value) is ''
    false


  ###
  Converts a value to boolean (if it can).
  @param value: The value to convert.
  @returns the converted boolean, otherwise the original value.
  ###
  toBool: (value) ->
    return value unless value?
    return value if _.isBoolean(value)
    asString = _.trim(value.toString()).toLowerCase()
    return true  if asString is 'true'
    return false if asString is 'false'
    value
