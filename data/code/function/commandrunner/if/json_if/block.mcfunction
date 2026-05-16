$setblock 0 0 0 $(block)
setblock 0 0 0 air

$execute unless block ~$(x) ~$(y) ~$(z) $(block) run return fail
$execute as @n[scores={runner_id=$(runner_id)}] at @s run setblock ~ ~ ~ redstone_block
execute store result entity @s data.context_output int 1 run scoreboard players get @s temp_id
