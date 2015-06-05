'use strict'
_ = require('lodash')
React = require('react')
PropTypes = _.clone(React.PropTypes)


# Store the parameter values on the returned
# validator functions so that external tools
# (such the UIHarness) can display the values.

PropTypes.oneOf = (enumValues) ->
  result = React.PropTypes.oneOf(enumValues)
  result.oneOf = enumValues
  result.isRequired.oneOf = enumValues
  result


PropTypes.shape = (shape) ->
  result = React.PropTypes.shape(shape)
  result.shape = shape
  result.isRequired.shape = shape
  result



# ----------------------------------------------------------------------------
module.exports = PropTypes
