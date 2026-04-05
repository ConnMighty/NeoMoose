execute unless entity @s[type=player] run return run execute as @a[distance=..2500] if score @s currentplot = @s id run title @s actionbar "sorry, but teleporting entities is currently not suppported! you can still teleport players though!"

$tp @s $(input)