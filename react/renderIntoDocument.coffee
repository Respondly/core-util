React = require('react/addons')
TestUtils = React.addons.TestUtils

###
Render a react component to the global document
@param reactComponent: The React component to wrap.
@param props:          Optional. The props to use.

@returns ReactElement.
###
module.exports = (reactComponent, props = null) ->
  TestUtils.renderIntoDocument(React.createElement(reactComponent, props))
