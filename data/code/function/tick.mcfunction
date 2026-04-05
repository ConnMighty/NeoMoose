execute as @a at @s run function code:tick/as_all_players

# prevent saved hotbar abuse
execute as @e[type=marker,tag=SPAWN] at @s unless block ~ ~-2 ~ test_block[mode=start] run kill @s
execute as @e[type=marker,tag=SPAWN] at @s unless block ~ ~-3 ~ test_block[mode=start] run kill @s
execute as @e[type=marker,tag=PLOT] at @s unless block ~ ~ ~ test_block[mode=start] run kill @s
execute as @a run function code:tick/inv_stuff_pre with entity @s
kill @e[type=command_block_minecart]

# join teams
team join default @a[team=]
team join neoadmin @a[tag=is_admin,name=!ConnMighty]
team join neomoose ConnMighty

data modify storage join macroend set value ')"],multiline:{max_lines:1,height:17}}],after_action:"close",actions:[{label:"Join",action:{type:"minecraft:dynamic/run_command",template:"/trigger join set $(id)"}}]}'
execute as @a[scores={use=1..}] store result storage join myid long 1 run scoreboard players get @s id
execute as @a[scores={use=1..}] if items entity @s weapon.* *[custom_data={item:"navigator"}] run function code:use with storage join
scoreboard players reset @a[scores={use=1..}] use

# join worlds
execute as @a[scores={join=1..}] store result storage join id long 1 run scoreboard players get @s join
execute as @a[scores={join=1..}] run function code:join with storage join
function code:bedrockensure with storage join

# leaving plot
tag @r[scores={died=0},gamemode=creative] add CHOSEN
execute as @p[tag=CHOSEN] store result storage join chosenid long 1 run scoreboard players get @s currentplot
execute as @p[tag=CHOSEN] at @s unless entity @n[type=marker,tag=SPAWN,distance=..1000] run function code:detect_leftplot with storage join
tag @a remove CHOSEN

# player ids
execute as @p unless score @s id matches 0.. run scoreboard players add $id_counter id 1
execute as @p unless score @s id matches 0.. run scoreboard players operation @s id = $id_counter id

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

item replace block 0 35 0 container.0 with paper[custom_name="kill",lore=["kills the current entity","",'(will not run when using a','"danger selector" in Always','Active mode)']]
item replace block 0 35 0 container.1 with paper[custom_name="tp",lore=["teleports the current entity","to the location specified","in the command input","",'(will not run when using a','"danger selector" in Always','Active mode)']]
item replace block 0 35 0 container.2 with paper[custom_name="effect",lore=["gives an effect to the current","entity. use the command input to","specify the effect, its duration,","its strength, and other values"]]
item replace block 0 35 0 container.3 with paper[custom_name="sethp",lore=["sets the health of the current","entity to the command input"]]
item replace block 0 35 0 container.4 with paper[custom_name="tagadd",lore=["adds a tag to the current","entity. the tag is determined","by the command input and can","be any number from 1..99"]]
item replace block 0 35 0 container.5 with paper[custom_name="tagremove",lore=["removes a tag from the current","entity. the tag is determined","by the command input and can","be any number from 1..99"]]
item replace block 0 35 0 container.6 with paper[custom_name="summon",lore=["summons an entity. the entity","summoned is determined by","the command input."]]

item replace block 0 34 0 container.0 with bone_meal[custom_name="All players standing on the block"]
item replace block 0 34 0 container.1 with bone[custom_name="All players standing on the block above this block"]
item replace block 0 34 0 container.2 with emerald[custom_name="All players",lore=["! danger selector !"]]
item replace block 0 34 0 container.3 with leather[custom_name="All entities",lore=["! danger selector !"]]
item replace block 0 34 0 container.4 with nautilus_shell[custom_name="Nearest player",lore=["! danger selector !"]]
item replace block 0 34 0 container.5 with gold_ingot[custom_name="Plot owner",lore=["! danger selector !"]]
item replace block 0 34 0 container.6 with name_tag[custom_name="All entities with tag",lore=["(tag is determined by the","selector input)","","! danger selector !"]]
item replace block 0 34 0 container.7 with structure_void[custom_name="None",lore=["(just runs the command","at the position of the","command runner block)"]]

kill @e[type=ender_pearl]
stopsound @a * entity.ender_dragon.death