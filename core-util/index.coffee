'use strict'
_ = require('lodash')

timer = require('./timer')
util  = require('./util')
func  = require('./func')


exports =
  Handlers: require('./Handlers')
  LocalStorage: require('./LocalStorage')

  delay: timer.delay
  interval: timer.interval
  functionParameters: func.functionParameters
  ns: require('./ns')
  color: require('./color')


_.merge(exports, util)
module.exports = exports
