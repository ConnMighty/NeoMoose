tag @s remove powered
execute if block ~ ~1 ~ redstone_wire unless block ~ ~1 ~ redstone_wire[power=0] run tag @s add powered
execute if block ~ ~2 ~ redstone_wire unless block ~ ~2 ~ redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~ redstone_wire unless block ~1 ~ ~ redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~ redstone_wire unless block ~-1 ~ ~ redstone_wire[power=0] run tag @s add powered
execute if block ~ ~ ~1 redstone_wire unless block ~ ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~ ~ ~-1 redstone_wire unless block ~ ~ ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~1 redstone_wire unless block ~1 ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~-1 redstone_wire unless block ~-1 ~ ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~-1 redstone_wire unless block ~1 ~ ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~1 redstone_wire unless block ~-1 ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~ ~1 ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~2 ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~1 ~ redstone_block run tag @s add powered
execute if block ~ ~2 ~ redstone_block run tag @s add powered
execute if block ~1 ~ ~ redstone_block run tag @s add powered
execute if block ~-1 ~ ~ redstone_block run tag @s add powered
execute if block ~ ~ ~1 redstone_block run tag @s add powered
execute if block ~ ~ ~-1 redstone_block run tag @s add powered
execute if block ~1 ~ ~1 redstone_block run tag @s add powered
execute if block ~-1 ~ ~-1 redstone_block run tag @s add powered
execute if block ~1 ~ ~-1 redstone_block run tag @s add powered
execute if block ~-1 ~ ~1 redstone_block run tag @s add powered
