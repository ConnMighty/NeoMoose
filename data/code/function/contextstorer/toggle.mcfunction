execute unless score @p currentplot = @p id run return fail

data remove entity @s interaction

execute at @s run playsound ui.button.click master @p ~ ~ ~ 1

execute unless score @n[type=block_display,tag=contextstorer,distance=..0.5] contextstorer_state matches 1.. run tag @s add switching_state_1
execute if score @n[type=block_display,tag=contextstorer,distance=..0.5] contextstorer_state matches 1 run tag @s add switching_state_0

execute if entity @s[tag=switching_state_1] run scoreboard players set @n[type=block_display,tag=contextstorer,distance=..0.5] contextstorer_state 1
execute if entity @s[tag=switching_state_0] run scoreboard players set @n[type=block_display,tag=contextstorer,distance=..0.5] contextstorer_state 0

execute if entity @s[tag=switching_state_1] run tellraw @p [{color:green,text:"context storer state set to: "},{color:gold,text:'"as test passers"'}]
execute if entity @s[tag=switching_state_0] run tellraw @p [{color:green,text:"context storer state set to: "},{color:gold,text:'"as initial selector"'}]

tag @s remove switching_state_1
tag @s remove switching_state_0
