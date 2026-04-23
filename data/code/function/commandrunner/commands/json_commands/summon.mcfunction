scoreboard players reset $temp_plot_entity_count count
execute as @e[distance=..2500,type=!player] run scoreboard players add $temp_plot_entity_count count 1
execute if score $temp_plot_entity_count count matches 502.. run return run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run title @s actionbar "can not summon because the entity cap for your plot has been reached! (500)"

$scoreboard players set $x_testfor var $(x)
execute unless score $x_testfor var matches -5000..5000 run return run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run title @s actionbar "can not summon entities that far out from your plot!"

$execute at @s run summon $(entity) ~$(x) ~$(y) ~$(z) $(nbt)
