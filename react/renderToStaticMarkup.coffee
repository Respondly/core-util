React = require('react')

###
Render a react component to static markup
@param reactComponent: The React component to render.
@param props:          Optional. The props to use.

@returns void.
###
module.exports = (reactComponent, props = null) ->
  React.renderToStaticMarkup(React.createElement(reactComponent, props))
