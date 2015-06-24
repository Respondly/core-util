'use strict'
_ = require('lodash')
expect = require('chai').expect
React = require('react')
PropTypes = React.PropTypes
Validator = require('core-util/react/Validator')


describe 'Validate PropTypes', ->
  it 'store propTypes on the validator', ->
    propTypes = { isEnabled: PropTypes.bool }
    expect(Validator(propTypes).propTypes).to.equal propTypes

  it 'store empty propTypes on the validator when nothing is passed', ->
    expect(Validator().propTypes).to.eql {}


  it 'reports (optional) component name within error message', ->
    result = Validator({ isEnabled: PropTypes.bool }).validate({ isEnabled:123 }, 'MyComponent')
    expect(result.errors.isEnabled.message).to.contain 'MyComponent'


  describe 'null values', ->
    it 'reports nothing if properties are not declared', ->
      expect(Validator({}).validate().isValid).to.equal true

    it 'reports nothing if propType is not declared', ->
      expect(Validator({}).validate({ foo:123, bar:'abc' }).isValid).to.equal true
      expect(Validator().validate({ foo:123, bar:'abc' }).isValid).to.equal true


  describe 'primitives (bool, string, number)', ->
    propTypes =
      myBool: PropTypes.bool
      myString: PropTypes.string
      myNumber: PropTypes.number

    describe 'is valid', ->
      it 'on all properties', ->
        props =
          myBool: true
          myString: 'Foo'
          myNumber: 123
        result = Validator(propTypes).validate(props)
        expect(result.isValid).to.equal true

      it 'when partial set of properties is passed', ->
        result = Validator(propTypes).validate({ myString:'Foo' })
        expect(result.isValid).to.equal true

      it 'when partial undefined properties values are passed', ->
        result = Validator(propTypes).validate({ myString:undefined, myNumber:undefined, myBool:undefined })
        expect(result.isValid).to.equal true

      it 'when partial null properties values are passed', ->
        result = Validator(propTypes).validate({ myString:null, myNumber:null, myBool:null })
        expect(result.isValid).to.equal true


    describe 'is not valid', ->
      it 'when wrong type passed (bool)', ->
        result = Validator(propTypes).validate({ myBool:123 })
        expect(result.isValid).to.equal false
        expect(result.errors.myBool).to.exist

      it 'when wrong type passed (string)', ->
        result = Validator(propTypes).validate({ myString:123 })
        expect(result.isValid).to.equal false
        expect(result.errors.myString).to.exist

      it 'when wrong type passed (number)', ->
        result = Validator(propTypes).validate({ myNumber:'hello' })
        expect(result.isValid).to.equal false
        expect(result.errors.myNumber).to.exist

      it 'when required value is passed', ->
        validator = Validator({ text: PropTypes.string.isRequired })
        expect(validator.validate().isValid).to.equal false
        expect(validator.validate({ foo:123 }).isValid).to.equal false


  describe 'Enum', ->
    it 'is valid', ->
      validator = Validator(enum: PropTypes.oneOf(['one', 'two']))
      result = validator.validate(enum:'one')
      expect(result.isValid).to.equal true

    it 'is not valid (wrong value)', ->
      validator = Validator(enum: PropTypes.oneOf(['one', 'two']))
      result = validator.validate(enum:'four')
      expect(result.isValid).to.equal false

    it 'is not valid (required)', ->
      validator = Validator(enum: PropTypes.oneOf(['one', 'two']).isRequired)
      result = validator.validate()
      expect(result.isValid).to.equal false


  describe 'Shape (Object)', ->
    it 'is valid', ->
      validator = Validator(obj: PropTypes.shape({ foo: PropTypes.string }))
      result = validator.validate(obj:{ foo:'hello' })
      expect(result.isValid).to.equal true

    it 'is not valid (wrong value)', ->
      validator = Validator(obj: PropTypes.shape({ foo: PropTypes.string }))
      result = validator.validate(obj:{ foo:123 })
      expect(result.isValid).to.equal false

    it 'is not valid (required)', ->
      validator = Validator(obj: PropTypes.shape({ foo: PropTypes.string.isRequired }))
      result = validator.validate(obj:{})
      expect(result.isValid).to.equal false
