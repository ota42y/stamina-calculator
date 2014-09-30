# stamina calculator
==========

This script is calculator for social game stamina.


# Usage

```
StaminaCalculator = require('stamina-alculator').StaminaCalculator

# puzzle and dragons example
# 1 stamina / 10 min
calc = new StaminaCalculator 10*60

# now stamina is 10 and max stamina is 60.
next_max_time = calc.getNextMaxStaminaTime(10, 60)
=> 50 * 10 * 60

# next multiple of n times.
# This return 4 time which now stamina is [15, 30, 45, 60].
next_multiple_time = calc.getMultipleRecoveryTime(10, 60, 15)

# get Date object
next_max_second = @stamina_calculator.getNextMaxStaminaTime(10, 60)
next_max_date = @stamina_calculator.convertToDate(next_max_second) # return date object 50*10*60 seconds from now

# lovelive! example
# 1 stamina / 6 min
calc = new StaminaCalculator 6*60

# now stamina is 10 and max stamina is 60.
next_max_time = calc.getNextMaxStaminaTime(10, 80)
=> 70 * 6 * 60

# next multiple of n times.
# This return 3 time which now stamina is [25, 50, 75].
next_multiple_time = calc.getMultipleRecoveryTime(10, 80, 25)

```
