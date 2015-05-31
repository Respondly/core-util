_ = require('lodash')


# NB: `localStorage` will not be available when
#      running within environments like JSDom.
store =
  _store: {}

  removeItem: (key) ->
    if localStorage?
      localStorage.removeItem(key)
    else
      delete @_store[key]

  setItem: (key, value) ->
    if localStorage?
      localStorage.setItem(key, value)
    else
      @_store[key] = value

  getItem: (key) ->
    if localStorage?
      localStorage.getItem(key)
    else
      @_store[key]




module.exports =
  ###
  Gets or sets the value for the given key.
  @param key:         The unique identifier of the value (this is prefixed with the namespace).
  @param value:       (optional). The value to set (pass null to remove).
  @param options:
            default:  (optional). The default value to return if the session does not contain the value (ie. undefined).
  ###
  prop: (key, value, options = {}) ->
    if value is null
      # REMOVE.
      store.removeItem(key)

    else if value isnt undefined
      # WRITE.
      type =  if _.isString(value)
                'string'
              else if _.isBoolean(value)
                'bool'
              else if _.isNumber(value)
                'number'
              else if _.isDate(value)
                'date'
              else
                'object'

      writeValue = { value:value, type:type }
      store.setItem(key, JSON.stringify(writeValue))

    else
      # READ ONLY.
      if json = store.getItem(key)
        json = JSON.parse(json)
        value = switch json.type
                  when 'null', 'bool', 'string' then json.value
                  when 'number' then json.value.toNumber()
                  when 'date' then new Date(json.value)
                  when 'object' then json.value

      else
        value = undefined
      value = options.default if value is undefined

    # Finish up.
    value
