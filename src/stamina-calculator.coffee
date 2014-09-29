class StaminaCalculator
  constructor: (stamina_recovery_time) ->
    @stamina_recovery_time = stamina_recovery_time

  getMultipleRecoveryTime: (now_stamina, max_stamina, multiple_stamina) ->
    recovery_time = []
    if now_stamina < max_stamina
      temp_stamina = 0
      while temp_stamina <= max_stamina
        if now_stamina < temp_stamina
          recovery_time.push (temp_stamina - now_stamina) * @stamina_recovery_time
        temp_stamina += multiple_stamina
    return recovery_time

  getNextMaxStaminaTime: (now_stamina, max_stamina) ->
    if now_stamina < max_stamina
      return (max_stamina - now_stamina) * @stamina_recovery_time
    return 0

  toDate: (second) ->
    return new Date(new Date().getTime() + second * 1000)


module.exports.StaminaCalculator = StaminaCalculator
