$tellraw @a[name=noone] $(input)

$execute as $(input) if entity @s[distance=..2500] as @n[type=block_display] at @s run setblock ~ ~ ~ redstone_block
