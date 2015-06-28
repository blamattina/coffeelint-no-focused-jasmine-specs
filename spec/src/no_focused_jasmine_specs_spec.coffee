NoFocusedJasmineSpecs = require '../../src/no_focused_jasmine_specs'

coffeelint = require 'coffeelint'
coffeelint.registerRule NoFocusedJasmineSpecs

describe 'test', ->

  beforeAll ->
    @config =
      no_focused_jasmine_specs:
        level: 'warn'

  describe 'a lint free spec', ->

    beforeEach ->
      passingSpec = '''
        describe "A focused suite", ->
          it "contains a  spec", ->
            expect(true).toBe true
      '''
      @errors = coffeelint.lint(passingSpec, @config)

    it 'has no errors', ->
      expect(@errors.length).toBe 0

  describe 'a focused describe block', ->

    beforeEach ->
      fdescribeSpec = '''
        fdescribe "A focused suite", ->
          it "contains a  spec", ->
            expect(true).toBe false
      '''
      @errors = coffeelint.lint(fdescribeSpec, @config)

    it 'has an error on line 1', ->
      expect(@errors.length).toBe 1
      error = @errors[0]
      expect(error.level).toBe 'warn'
      expect(error.lineNumber).toBe 1
      expect(error.rule).toBe 'no_focused_jasmine_specs'

  describe 'a focused it spec', ->

    beforeEach ->
      fitSpec = '''
        describe "A suite", ->
          fit "contains a focus spec", ->
            expect(true).toBe false
      '''
      @errors = coffeelint.lint(fitSpec, @config)

    it 'has an error on line 1', ->
      expect(@errors.length).toBe 1
      error = @errors[0]
      expect(error.level).toBe 'warn'
      expect(error.lineNumber).toBe 2
      expect(error.rule).toBe 'no_focused_jasmine_specs'


