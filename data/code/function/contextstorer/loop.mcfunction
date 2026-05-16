execute unless block ~ ~ ~ barrier run kill @s

execute unless score @s contextstorer_state matches 1.. positioned ^ ^ ^1 run data modify entity @s data.context set from entity @n[distance=..0.5,type=block_display,tag=runner] data.context_output
execute if score @s contextstorer_state matches 1 positioned ^ ^ ^1 run data modify entity @s data.context set from entity @n[distance=..0.5,type=block_display,tag=runner] data.context_output_ifentity
execute positioned ^ ^ ^-1 run data modify entity @n[distance=..0.5,type=block_display,tag=runner] data.context_input set from entity @s data.context
