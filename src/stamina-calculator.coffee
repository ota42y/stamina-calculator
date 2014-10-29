class StaminaCalculator
  constructor: (stamina_recovery_time) ->
    @stamina_recovery_time = stamina_recovery_time

  getMultipleRecoveryTime: (now_stamina, max_stamina, multiple_stamina) ->
    recovery_time = []
    if now_stamina < max_stamina
      temp_stamina = 0
      while temp_stamina <= max_stamina
        if now_stamina < temp_stamina
          recovery_time.push @getRecoveredTime(temp_stamina - now_stamina)
        temp_stamina += multiple_stamina
    return recovery_time

  getNextMaxStaminaTime: (now_stamina, max_stamina) ->
    if now_stamina < max_stamina
      return @getRecoveredTime(max_stamina - now_stamina)
    return 0

  getNextLevelupCount: (next_exp, get_exp) ->
    if get_exp != 0
      return Math.ceil(next_exp / get_exp)
    return -1

  getRecoveredTime: (recovered_stamina) ->
    return recovered_stamina * @stamina_recovery_time

  convertToDate: (second) ->
    return new Date(new Date().getTime() + second * 1000)


module.exports.StaminaCalculator = StaminaCalculator
