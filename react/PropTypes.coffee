'use strict'
_ = require('lodash')
React = require('react')
PropTypes = _.clone(React.PropTypes)


# Store the parameter values on the returned
# validator functions so that external tools
# (such the UIHarness) can display the values.

PropTypes.oneOf = (expectedValues) ->
  result = React.PropTypes.oneOf(expectedValues)
  result.expectedValues = expectedValues
  result


PropTypes.shape = (types) ->
  result = React.PropTypes.shape(types)
  result.types = types
  result



# ----------------------------------------------------------------------------
module.exports = PropTypes
