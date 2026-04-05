execute if items block ~ ~-1 ~ container.11 red_stained_glass_pane run return fail

$execute if items block ~ ~-1 ~ container.15 structure_void positioned ~ ~$(selector_input) ~ run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 leather run execute as @e[tag=!PLOT,tag=!SPAWN,distance=..2500] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 name_tag run execute as @e[tag=!PLOT,tag=!SPAWN,distance=..2500,tag=plottag_$(selector_input)] run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 gold_ingot run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 nautilus_shell run execute as @p[distance=..2500] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 emerald run execute as @a[distance=..2500] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 bone_meal positioned ~ ~1 ~ run execute as @a[distance=..0.6] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 bone positioned ~ ~2 ~ run execute as @a[distance=..0.6] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 red_stained_glass_pane positioned ~ ~1 ~ run execute as @a[distance=..0.6] at @s run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"