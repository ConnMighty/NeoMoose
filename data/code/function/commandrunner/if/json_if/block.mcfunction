$setblock 0 0 0 $(block)
setblock 0 0 0 air

$execute if block ~$(x) ~$(y) ~$(z) $(block) at @s run setblock ~ ~ ~ redstone_block
