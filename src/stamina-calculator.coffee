class StaminaCalculator
  constructor: (stamina_recovery_time) ->
    @stamina_recovery_time = stamina_recovery_time

  getMultipleRecoveryTime: (now_stamina, max_stamina, multiple_stamina) ->
    return [15*360, 40*360, 65*360, 50*360]

  getNextMaxStaminaTime: (now_stamina, max_stamina) ->
    return 50*360


module.exports.StaminaCalculator = StaminaCalculator
