'use strict'
_ = require('lodash')


module.exports =

  ###
  Converts an alpha value into an `argb` color.
  @param value: The alpha value

                -1..0: Alpha percentage of black.
                 0..1: Apha percentage of white.

                If a string is passed, the string value is returned
                assuming it to be an explicit color value (no-op).

  ###
  fromAlpha: (value) ->
    return value unless _.isNumber(value)
    value = -1 if value < -1
    value = 1 if value > 1

    if value is 0
      return 'transparent'

    else if value < 0
      return "rgba(0, 0, 0, #{ Math.abs(value) })"

    else if value > 0
      return "rgba(255, 255, 255, #{ value })"
