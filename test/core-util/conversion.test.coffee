'use strict'
expect = require('chai').expect
util = require('../../')



describe 'Conversion:toBool', ->
  describe 'existing Boolean value', ->
    it 'true (no change)', ->
      expect(util.toBool(true)).to.equal true

    it 'false (no change)', ->
      expect(util.toBool(false)).to.equal false

  describe 'string to Boolean', ->
    it 'converts "true" (string) to true', ->
      expect(util.toBool('true')).to.equal true
      expect(util.toBool('True')).to.equal true
      expect(util.toBool('   truE   ')).to.equal true

    it 'converts "false" (string) to false', ->
      expect(util.toBool('false')).to.equal false
      expect(util.toBool('False')).to.equal false
      expect(util.toBool('   falSe   ')).to.equal false

  it 'does not convert other value types', ->
    expect(util.toBool()).to.equal undefined
    expect(util.toBool(null)).to.equal null
    expect(util.toBool('Foo')).to.equal 'Foo'
    expect(util.toBool('')).to.equal ''
    expect(util.toBool(' ')).to.equal ' '
    expect(util.toBool(123)).to.equal 123
    expect(util.toBool({foo:123})).to.eql {foo:123}
