timer = require('./core-util/timer')
util  = require('./core-util/util')
func  = require('./core-util/func')

module.exports =
  Handlers: require('./core-util/Handlers')
  LocalStorage: require('./core-util/LocalStorage')

  delay: timer.delay
  interval: timer.interval
  isBlank: util.isBlank
  functionParameters: func.functionParameters
