StaminaCalculator = require('../src/stamina-calculator.coffee').StaminaCalculator

describe "StaminaCalculator", ->
  beforeEach (done) ->
    done()

  describe "check data", ->
    @stamina_calculator = null
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator 10*60
      done()

    it 'getStaminaRecoveryNime', (done)->
      assert.equal @stamina_calculator.stamina_recovery_time, 10*60
      done()
