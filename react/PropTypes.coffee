'use strict'
React = require('react')
_ = require('lodash')

PropTypes = _.clone(React.PropTypes)


PropTypes.oneOf = (expectedValues) ->
  # Store the enum values on the returned
  # validator function so that the ui-harness
  # can display the values for editing.
  result = React.PropTypes.oneOf(expectedValues)
  result.expectedValues = expectedValues
  result



module.exports = PropTypes
