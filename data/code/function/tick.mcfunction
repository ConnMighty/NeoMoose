# qol
execute as @a run data modify entity @s foodLevel set value 25
playerlist @a footer set vote? :)

# prevent saved hotbar abuse
execute as @e[type=marker,tag=SPAWN] at @s unless block ~ ~-2 ~ test_block[mode=start] run kill @s
execute as @e[type=marker,tag=SPAWN] at @s unless block ~ ~-3 ~ test_block[mode=start] run kill @s
execute as @e[type=marker,tag=PLOT] at @s unless block ~ ~ ~ test_block[mode=start] run kill @s
#clear @a #spwneggs[entity_data]
execute as @a run function code:inv_stuff_pre with entity @s

# join teams
team join default @a[name=!ConnMighty]
team join neoadmin @a[tag=is_admin,name=!ConnMighty]
team join neomoose ConnMighty

# enable triggers
scoreboard players enable @a join
scoreboard players enable @a spawn

# go to spawn
execute as @a[scores={spawn=1..}] run tag @s remove gotnav
execute as @a[scores={spawn=1..}] run scoreboard players reset @s spawn

# navigator
tag @a[scores={left=1..}] remove gotnav
scoreboard players reset @a[scores={left=1..}] left
#tag @a[scores={died=1..}] remove gotnav

tp @a[tag=!gotnav] 0 62 0
spawnpoint @a[tag=!gotnav] 0 62 0
execute as @a[tag=!gotnav] run attribute @s minecraft:block_interaction_range base reset
execute as @a[tag=!gotnav] run data remove entity @s fall_distance
execute as @a[tag=!gotnav] run data remove entity @s Motion
execute as @a[tag=!gotnav] run data modify entity @s Health set value 20
clear @a[tag=!gotnav]
effect clear @a[tag=!gotnav]
gamemode adventure @a[tag=!gotnav]
item replace entity @a[tag=!gotnav] hotbar.4 with \
    carrot_on_a_stick\
    [\
        custom_data={\
            item:"navigator",\
        },\
        minecraft:custom_name={\
            extra:[\
                {\
                    bold:1b,\
                    color:"light_purple",\
                    italic:0b,\
                    text:"Click to Play",\
                    underlined:0b,\
                }\
            ],\
            text:"",\
        },\
        item_model="minecraft:compass",\
    ]
\
tag @a[tag=!gotnav] add gotnav

data modify storage join macroend set value ')"],multiline:{max_lines:1,height:17}}],after_action:"close",actions:[{label:"Join",action:{type:"minecraft:dynamic/run_command",template:"/trigger join set $(id)"}}]}'
execute as @a[scores={use=1..}] store result storage join myid long 1 run scoreboard players get @s id
execute as @a[scores={use=1..}] run function code:use with storage join
scoreboard players reset @a[scores={use=1..}] use

# join worlds
execute as @a[scores={join=1..}] store result storage join id long 1 run scoreboard players get @s join
execute as @a[scores={join=1..}] run function code:join with storage join
function code:bedrockensure with storage join

execute as @a at @s if entity @n[type=marker,tag=SPAWN,distance=..1000] run gamemode adventure @s[tag=!is_admin]
execute as @a at @s if entity @n[type=marker,tag=SPAWN,distance=..1000] run scoreboard players reset @s currentplot

# leaving plot
execute as @a unless score @s died matches 0.. run scoreboard players set @s died 0

tag @r[scores={died=0},gamemode=creative] add CHOSEN
execute as @p[tag=CHOSEN] store result storage join chosenid long 1 run scoreboard players get @s currentplot
execute as @p[tag=CHOSEN] at @s unless entity @n[type=marker,tag=SPAWN,distance=..1000] run function code:detect_leftplot with storage join
tag @a remove CHOSEN

# player ids
execute as @p unless score @s id matches 0.. run scoreboard players add $id_counter id 1
execute as @p unless score @s id matches 0.. run scoreboard players operation @s id = $id_counter id

# plot tools
execute as @a if score @s currentplot = @s id run scoreboard players enable @s gamemode
execute as @a unless score @s currentplot = @s id run scoreboard players reset @s gamemode
execute as @a[scores={gamemode=1..}] run function code:gamemode_switch

execute as @a if score @s currentplot = @s id run scoreboard players enable @s default_visitor_gamemode
execute as @a unless score @s currentplot = @s id run scoreboard players reset @s default_visitor_gamemode
execute as @a[scores={default_visitor_gamemode=1..}] store result storage temp id long 1 run scoreboard players get @s id
execute as @a[scores={default_visitor_gamemode=1..}] run function code:default_visitor_gamemode_switch with storage temp

execute as @a if score @s currentplot = @s id run scoreboard players enable @s allow_visits
execute as @a unless score @s currentplot = @s id run scoreboard players reset @s allow_visits
execute as @a[scores={allow_visits=1..}] store result storage temp id long 1 run scoreboard players get @s id
execute as @a[scores={allow_visits=1..}] run function code:allow_visits_switch with storage temp

execute as @a if score @s currentplot = @s id run scoreboard players enable @s allow_visitor_block_interactions
execute as @a unless score @s currentplot = @s id run scoreboard players reset @s allow_visitor_block_interactions
execute as @a[scores={allow_visitor_block_interactions=1..}] store result storage temp id long 1 run scoreboard players get @s id
execute as @a[scores={allow_visitor_block_interactions=1..}] run function code:allow_visitor_block_interactions_switch with storage temp

# chest auto-refiller block
execute as @a[gamemode=adventure] unless score @s currentplot = @s id run clear @s bat_spawn_egg[item_model="test_instance_block"]
execute as @e[type=block_display,tag=refiller,tag=!old] at @s run playsound block.stone.place master @a ~ ~ ~
execute as @e[type=block_display,tag=refiller,tag=!old] at @s run setblock ~ ~ ~ barrier
execute as @e[type=block_display,tag=refiller,tag=!old] run tag @s add old
execute as @e[type=block_display,tag=refiller] at @s run function code:chestrefiller

# command runner block
execute as @a[gamemode=adventure] unless score @s currentplot = @s id run clear @s bat_spawn_egg[item_model="command_block"]
execute as @e[type=block_display,tag=runner,tag=!old] at @s run playsound block.stone.place master @a ~ ~ ~
execute as @e[type=block_display,tag=runner,tag=!old] at @s run setblock ~ ~ ~ barrier
execute as @e[type=block_display,tag=runner,tag=!old] run tag @s add old
execute as @e[type=block_display,tag=runner] at @s unless score $commandrunner_cooldown count matches 1.. run function code:commandrunner/commandrunner with entity @s
scoreboard players remove $commandrunner_cooldown count 1
execute as @e[type=block_display,tag=runner] at @s positioned ~ ~-1 ~ unless entity @n[type=interaction,distance=..0.1] run summon interaction ~ ~ ~ {width:1.05,height:1.05,Tags:["openhere"]}

execute as @e[type=interaction,tag=openhere] at @s unless block ~ ~ ~ barrel run kill @s
execute as @e[type=interaction,tag=openhere] at @s if data entity @s interaction on target run inventory @s block ~ ~ ~ Container
execute as @e[type=interaction,tag=openhere] at @s if data entity @s interaction run data remove entity @s interaction

clear @a red_stained_glass_pane[item_name="Selector"]
clear @a red_stained_glass_pane[item_name="Command"]
clear @a red_stained_glass_pane[item_name="Impulse or Repeating"]
clear @a red_stained_glass_pane[item_name="Always Active?"]
clear @a black_stained_glass_pane[item_name="Command Input"]
clear @a black_stained_glass_pane[item_name="Selector Input"]

execute as @a if items entity @s player.cursor diamond[item_name="See All Commands"] run inventory @s block 0 35 0 List of All Commands
execute as @a if items entity @s player.cursor diamond[item_name="See All Commands"] run clear @s diamond[item_name="See All Commands"]
execute as @a if items entity @s container.* diamond[item_name="See All Commands"] run clear @s diamond[item_name="See All Commands"]
item replace block 0 35 0 container.0 with paper[custom_name="kill",lore=["kills the current entity","",'(will not run when using a','"danger selector" in Always','Active mode)']]
item replace block 0 35 0 container.1 with paper[custom_name="tp",lore=["teleports the current entity","to the location specified","in the command input","",'(will not run when using a','"danger selector" in Always','Active mode)']]
item replace block 0 35 0 container.2 with paper[custom_name="effect",lore=["gives an effect to the current","entity. use the command input to","specify the effect, its duration,","its strength, and other values"]]
item replace block 0 35 0 container.3 with paper[custom_name="sethp",lore=["sets the health of the current","entity to the command input"]]
item replace block 0 35 0 container.4 with paper[custom_name="tagadd",lore=["adds a tag to the current","entity. the tag is determined","by the command input and can","be any number from 1..99"]]
item replace block 0 35 0 container.5 with paper[custom_name="tagremove",lore=["removes a tag from the current","entity. the tag is determined","by the command input and can","be any number from 1..99"]]
item replace block 0 35 0 container.6 with paper[custom_name="summon",lore=["summons an entity. the entity","summoned is determined by","the command input."]]

execute as @a if items entity @s player.cursor diamond[item_name="See All Selectors"] run inventory @s block 0 34 0 List of All Selectors
execute as @a if items entity @s player.cursor diamond[item_name="See All Selectors"] run clear @s diamond[item_name="See All Selectors"]
execute as @a if items entity @s container.* diamond[item_name="See All Selectors"] run clear @s diamond[item_name="See All Selectors"]
item replace block 0 34 0 container.0 with bone_meal[custom_name="All players standing on the block"]
item replace block 0 34 0 container.1 with bone[custom_name="All players standing on the block above this block"]
item replace block 0 34 0 container.2 with emerald[custom_name="All players",lore=["! danger selector !"]]
item replace block 0 34 0 container.3 with leather[custom_name="All entities",lore=["! danger selector !"]]
item replace block 0 34 0 container.4 with nautilus_shell[custom_name="Nearest player",lore=["! danger selector !"]]
item replace block 0 34 0 container.5 with gold_ingot[custom_name="Plot owner",lore=["! danger selector !"]]
item replace block 0 34 0 container.6 with name_tag[custom_name="All entities with tag",lore=["(tag is determined by the","selector input)","","! danger selector !"]]
item replace block 0 34 0 container.7 with structure_void[custom_name="None",lore=["(just runs the command","at the position of the","command runner block)"]]

execute as @a if score @s currentplot = @s id run scoreboard players enable @s give_plotbuilding_items
execute as @a unless score @s currentplot = @s id run scoreboard players reset @s give_plotbuilding_items
execute as @a[scores={give_plotbuilding_items=1..}] run function code:give_plotbuilding_items

scoreboard players reset @a[scores={died=1..}] died

kill @e[type=ender_pearl]
stopsound @a * entity.ender_dragon.death

# attempted plot settings menu
#execute as @a if score @s currentplot = @s id run scoreboard players enable @s myplotsettings
#execute as @a unless score @s currentplot = @s id run scoreboard players reset @s myplotsettings
#execute as @a[scores={myplotsettings=1..}] run scoreboard players enable @s defgm
#execute as @a[scores={myplotsettings=1..}] run scoreboard players enable @s disableothertriggers
#execute as @a[scores={myplotsettings=1..}] run dialog show @s {type:"minecraft:multi_action",title:"",inputs:[{type:"minecraft:single_option",key:"defgm",width:200,label:"Default Visitor Gamemode",options:[{id:"3",display:"Creative"},{id:"2",display:"Survival"},{id:"1",display:"Adventure",initial:1b}]}],can_close_with_escape:0b,after_action:"none",actions:[{label:"⬆ Apply Above Setting ⬆",width:130,action:{type:"minecraft:dynamic/run_command",template:"/trigger defgm set $(defgm)"}}]}
#execute as @a[scores={myplotsettings=1..}] run scoreboard players reset @s myplotsettings

#execute as @a[scores={disableothertriggers=1..}] run function code:settings/disable_settings_triggers

#execute as @a[scores={defgm=1..}] run function code:settings/disable_settings_triggers
#execute as @a[scores={defgm=1..}] store result storage plotdata temp long 1 run scoreboard players get @s id
#execute as @a[scores={defgm=1..}] run function code:settings/store_defgm with storage plotdata
#execute as @a[scores={defgm=1..}] run function code:settings/disable_settings_triggers

# bats
#scoreboard players add @e[type=bat,tag=boom,distance=..1000] count 1
#execute as @e[type=bat,tag=boom] at @s if score @s count matches 1000.. run particle totem_of_undying ~ ~ ~ 1 1 1 .2 50 force @a
#execute as @e[type=bat,tag=boom] if score @s count matches 1000.. run tp @s ~ ~-500 ~
# this was for the grand opening ^^^
