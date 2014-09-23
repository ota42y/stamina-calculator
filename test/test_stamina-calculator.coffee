StaminaCalculator = require('../src/stamina-calculator.coffee').StaminaCalculator

describe "StaminaCalculator", ->
  beforeEach (done) ->
    done()

  describe "initialize", ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator 10*60
      done()

    it 'stamina_recovery_time', (done)->
      assert.equal @stamina_calculator.stamina_recovery_time, 10*60
      done()

  describe 'getMultipleRecoveryTime', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator 10*60
      done()

    it 'correct data', (done)->
      expect(@stamina_calculator.getMultipleRecoveryTime(10, 60, 15)).to.eql([5*60, 20*60, 35*60, 50*60])
      done()

  describe 'getNextMaxStaminaTime', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator 10*60
      done()

    it 'correct data', (done)->
      expect(@stamina_calculator.getNextMaxStaminaTime(10, 60)).to.eql(50*60)
      done()
