# qol
data modify entity @s foodLevel set value 25
playerlist @s footer set vote? :)

# enable triggers
scoreboard players enable @s join
scoreboard players enable @s spawn

# go to spawn
execute if score @s spawn matches 1.. run tag @s remove gotnav
execute if score @s spawn matches 1.. run scoreboard players reset @s spawn

tag @s[scores={left=1..}] remove gotnav
scoreboard players reset @s[scores={left=1..}] left

execute as @s[tag=!gotnav] run function code:tick/got_nav

execute if entity @n[type=marker,tag=SPAWN,distance=..1000] run gamemode adventure @s[tag=!is_admin]
execute if entity @n[type=marker,tag=SPAWN,distance=..1000] run scoreboard players reset @s currentplot

# plot tools
## gamemode switching
execute if score @s currentplot = @s id run scoreboard players enable @s gamemode
execute unless score @s currentplot = @s id run scoreboard players reset @s gamemode
execute if score @s gamemode matches 1.. run function code:gamemode_switch

# plot settings
## default visitor gamemode
execute if score @s currentplot = @s id run scoreboard players enable @s default_visitor_gamemode
execute unless score @s currentplot = @s id run scoreboard players reset @s default_visitor_gamemode
execute if score @s default_visitor_gamemode matches 1.. store result storage temp id long 1 run scoreboard players get @s id
execute if score @s default_visitor_gamemode matches 1.. run function code:settings/default_visitor_gamemode_switch with storage temp

## allow visits
execute if score @s currentplot = @s id run scoreboard players enable @s allow_visits
execute unless score @s currentplot = @s id run scoreboard players reset @s allow_visits
execute if score @s allow_visits matches 1.. store result storage temp id long 1 run scoreboard players get @s id
execute if score @s allow_visits matches 1.. run function code:settings/allow_visits_switch with storage temp

## allow visitor block interactions
execute if score @s currentplot = @s id run scoreboard players enable @s allow_visitor_block_interactions
execute unless score @s currentplot = @s id run scoreboard players reset @s allow_visitor_block_interactions
execute if score @s allow_visitor_block_interactions matches 1.. store result storage temp id long 1 run scoreboard players get @s id
execute if score @s allow_visitor_block_interactions matches 1.. run function code:settings/allow_visitor_block_interactions_switch with storage temp

# command runner UI diamonds
execute if items entity @s player.cursor diamond[item_name="See All Commands"] run inventory @s block 0 35 0 List of All Commands
clear @s diamond[item_name="See All Commands"]

execute if items entity @s player.cursor diamond[item_name="See All Selectors"] run inventory @s block 0 34 0 List of All Selectors
clear @s diamond[item_name="See All Selectors"]

# plotbuilding items
execute if score @s currentplot = @s id run scoreboard players enable @s give_plotbuilding_items
execute unless score @s currentplot = @s id run scoreboard players reset @s give_plotbuilding_items
execute if score @s give_plotbuilding_items matches 1.. run function code:give_plotbuilding_items

# reset death detection
scoreboard players reset @s[scores={died=1..}] died