$scoreboard players set $x_testfor var $(x)
execute unless score $x_testfor var matches -5000..5000 run return run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run title @s actionbar "can not place blocks that far out from your plot!"

$setblock ~$(x) ~$(y) ~$(z) $(block){}