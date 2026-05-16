$damage $(input) 0

$execute unless entity $(input) run return fail
$execute as $(input) unless entity @s[distance=..2500] at @s run return fail
$execute as $(input) store result entity @n[scores={runner_id=$(runner_id)}] data.context_output_ifentity int 1 run scoreboard players get @s temp_id
$execute as @n[scores={runner_id=$(runner_id)}] at @s run setblock ~ ~ ~ redstone_block
execute store result entity @s data.context_output int 1 run scoreboard players get @s temp_id
