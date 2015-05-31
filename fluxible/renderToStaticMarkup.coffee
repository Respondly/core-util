React = require('react')
wrapComponent = require('./wrapComponent')

###
Render a react component to static markup using the given appContext
@param appContext:     The Fluxible 'app context' to use.
@param reactComponent: The React component to wrap.
@param props:          Optional. The props to use.

@returns void.
###
module.exports = (appContext, reactComponent, props = null) ->
  React.renderToStaticMarkup(wrapComponent.apply(null, arguments))
