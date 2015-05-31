React = require('react')
FluxibleComponent = require('fluxible/addons/FluxibleComponent')

###
Wraps a react component inside a FluxibleComponent in order to give it access
to a Fluxible appContext.

@param appContext:     The Fluxible 'app context' to use.
@param reactComponent: The React component to wrap.
@param props:          Optional. The props to use.

@returns ReactElement: The ReactElement ready to be rendered into the DOM.
###
module.exports = (appContext, reactComponent, props = null) ->
  React.createElement(
    FluxibleComponent,
    { context: appContext.getComponentContext() },
    React.createElement(reactComponent, props)
  )
