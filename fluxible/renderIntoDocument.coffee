TestUtils = require('react/addons').addons.TestUtils
wrapComponent = require('./wrapComponent')

###
Render a react component to the global document using the given appContext
@param appContext:     The Fluxible 'app context' to use.
@param reactComponent: The React component to wrap.
@param props:          Optional. The props to use.

@returns ReactElement.
###
module.exports = (appContext, reactComponent, props = null) ->
  TestUtils.renderIntoDocument(wrapComponent.apply(null, arguments))
