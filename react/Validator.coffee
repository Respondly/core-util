'use strict'
_ = require('lodash')


###
A helper object for validating a set of PropTypes.
###
Validator = (propTypes = {}) ->
  api =
    propTypes: propTypes

    ###
    Validates the given properties.
    @param props: An object of properties to validate.
    @param componentName: Optional. The name of the component being validated.
                          Used in error message.
    @returns results object.
    ###
    validate: (props = {}, componentName) ->
      result = { isValid:true }

      for own key, validator of propTypes
        error = validator(props, key, componentName)
        if error isnt null
          result.isValid = false
          result.errors ?= {}
          result.errors[key] = error

      result



# ----------------------------------------------------------------------------
module.exports = Validator
