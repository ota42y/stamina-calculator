class StaminaCalculator
  constructor: (stamina_recovery_time) ->
    @stamina_recovery_time = stamina_recovery_time

  getMultipleRecoveryTime: (now_stamina, max_stamina, multiple_stamina) ->
    return [5*60, 20*60, 35*60, 50*60]

  getNextMaxStaminaTime: (now_stamina, max_stamina) ->
    return 50*60


module.exports.StaminaCalculator = StaminaCalculator
