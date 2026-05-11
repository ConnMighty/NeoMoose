execute if items block ~ ~-1 ~ container.11 red_stained_glass_pane run return fail

$execute if items block ~ ~-1 ~ container.10 writable_book run return run function code:commandrunner/commands/json_commands/selector with storage runner "$(UUID)"

$execute if items block ~ ~-1 ~ container.15 rabbit_foot run execute as @e[tag=!PLOT,tag=!SPAWN,distance=..2500,type=$(selector_input_type)] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 structure_void positioned ~ ~$(selector_input) ~ run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 leather run execute as @e[tag=!PLOT,tag=!SPAWN,distance=..2500] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 name_tag run execute as @e[tag=!PLOT,tag=!SPAWN,distance=..2500,tag=plottag_$(selector_input)] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 gold_ingot run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 nautilus_shell run execute as @p[distance=..2500] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 emerald run execute as @a[distance=..2500] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 bone_meal positioned ~ ~1 ~ run execute as @a[distance=..0.6] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 bone positioned ~ ~2 ~ run execute as @a[distance=..0.6] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
$execute if items block ~ ~-1 ~ container.15 red_stained_glass_pane positioned ~ ~1 ~ run execute as @a[distance=..0.6] at @s run return run function code:commandrunner/commands/$(function) with storage runner "$(UUID)"
