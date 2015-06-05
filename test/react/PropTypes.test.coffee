'use strict'
expect = require('chai').expect
{ PropTypes } = require('core-util/react')


describe.only 'React', ->
  describe 'PropTypes.oneOf', ->
    it 'stores enum values on return object', ->
      result = PropTypes.oneOf(['one', 'two'])
      expect(result.oneOf).to.eql ['one', 'two']


    it 'stores enum values on the corresponding `isRequired` object', ->
      result = PropTypes.oneOf(['one', 'two'])
      expect(result.isRequired.oneOf).to.eql ['one', 'two']


  describe 'PropTypes.shape', ->
    it 'stores the shape on the return object', ->
      result = PropTypes.shape({ isEnabled: PropTypes.bool })
      expect(result.shape).to.eql { isEnabled: PropTypes.bool }


    it 'stores the shape on the corresponding `isRequired` object', ->
      result = PropTypes.shape({ isEnabled: PropTypes.bool })
      expect(result.isRequired.shape).to.eql { isEnabled: PropTypes.bool }
