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

  getNextLevelupTimes: (next_exp, get_exp) ->
    if get_exp != 0
      return next_exp / get_exp
    return -1

  convertToDate: (second) ->
    return new Date(new Date().getTime() + second * 1000)


module.exports.StaminaCalculator = StaminaCalculator
