'use strict'
_ = require('lodash')

timer = require('./core-util/timer')
util  = require('./core-util/util')
func  = require('./core-util/func')


exports =
  Handlers: require('./core-util/Handlers')
  LocalStorage: require('./core-util/LocalStorage')

  delay: timer.delay
  interval: timer.interval
  functionParameters: func.functionParameters


_.merge(exports, util)


# ----------------------------------------------------------------------------
module.exports = exports
