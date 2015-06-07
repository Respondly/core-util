'use strict'
_ = require('lodash')
util = require('./util')



###
Safely creates the given namespace on the root object.

@param root:      The root object.
@param namespace: The dot-delimited NS string (excluding the root object).

@returns the child object of the namespace.
###
module.exports = (root, namespace) ->
  if _.isString(root) or _.isArray(root)
    namespace = root
    root = null
  return if util.isBlank(namespace)

  getOrCreate = (parent, name) ->
      parent[name] ?= {}
      parent[name]

  add = (parent, parts) ->
      part = getOrCreate parent, parts[0]
      if parts.length > 1
        parts.splice(0, 1)
        part = add part, parts  # <= RECURSION.
      part

  # Build the namespace.
  namespace = namespace.split('.') unless _.isArray(namespace)
  result = add(root, namespace)
