StaminaCalculator = require('../src/stamina-calculator.coffee').StaminaCalculator

describe "StaminaCalculator", ->
  @stamina_recovery_time = null
  beforeEach (done) ->
    @stamina_recovery_time = 6*60
    done()

  describe "initialize", ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time
      done()

    it 'stamina_recovery_time', (done)->
      assert.equal @stamina_calculator.stamina_recovery_time, @stamina_recovery_time
      done()

  describe 'getMultipleRecoveryTime', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time
      done()

    it 'correct data', (done)->
      expect(@stamina_calculator.getMultipleRecoveryTime(10, 75, 25)).to.eql([15*@stamina_recovery_time, 40*@stamina_recovery_time, 65*@stamina_recovery_time])
      done()

    it 'max data', (done) ->
      expect(@stamina_calculator.getMultipleRecoveryTime(25, 25, 2)).to.eql([])
      done()

    it 'invalid data', (done) ->
      expect(@stamina_calculator.getMultipleRecoveryTime(75, 25, 25)).to.eql([])
      done()

  describe 'getNextMaxStaminaTime', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time
      done()

    it 'correct data', (done)->
      expect(@stamina_calculator.getNextMaxStaminaTime(10, 60)).to.eql(50*@stamina_recovery_time)
      done()

    it 'max data', (done) ->
      expect(@stamina_calculator.getNextMaxStaminaTime(60, 60)).to.eql(0)
      done()

    it 'invalid data', (done) ->
      expect(@stamina_calculator.getNextMaxStaminaTime(60, 10)).to.eql(0)
      done()

  describe 'convertToDate', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time

      @clock = sinon.useFakeTimers(0, "setTimeout", "clearTimeout", "setInterval", "clearInterval", "Date")

      done()

    it 'correct date', (done)->
      next_max_second = @stamina_calculator.getNextMaxStaminaTime(10, 60)

      next_max_date = @stamina_calculator.convertToDate(next_max_second).getTime()
      expect(next_max_date).to.eql((new Date(50*@stamina_recovery_time)).getTime() * 1000)
      done()

  describe 'getNextLevelupCount', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time
      done()

    it 'correct data', (done)->
      next_levelup_clear_times = @stamina_calculator.getNextLevelupCount(86 * 25, 86)
      expect(next_levelup_clear_times).to.eql(25)
      done()

    it 'small data', (done) ->
      next_levelup_clear_times = @stamina_calculator.getNextLevelupCount(1, 86)
      expect(next_levelup_clear_times).to.eql(1)
      done()

    it 'invalid data', (done) ->
      next_levelup_clear_times = @stamina_calculator.getNextLevelupCount(1, 0)
      expect(next_levelup_clear_times).to.eql(-1)
      done()

  describe 'getRecoveredTime', ->
    beforeEach (done) ->
      @stamina_calculator = new StaminaCalculator @stamina_recovery_time
      done()

    it 'correct data', (done)->
      recover_time = @stamina_calculator.getRecoveredTime(125)
      expect(recover_time).to.eql(125 * @stamina_recovery_time)
      done()
