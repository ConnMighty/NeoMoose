scoreboard players reset @s join
$execute if score @s id = $$(id) id run tag @s add myplot

$execute unless entity @s[tag=myplot] if score $visitsallowed_plot_$(id) var matches 1 run return run tellraw @s {color:red,text:"Sorry, but it looks like this plot has visiting disabled!"}

$scoreboard players set @s currentplot $(id)

tellraw @s[tag=!myplot] [{italic:true,color:gray,text:"{"},{italic:true,color:yellow,text:"I"},{italic:true,color:gray,text:"} "},{italic:true,color:green,text:"you can use "},{italic:true,color:light_purple,text:"/trigger spawn"},{italic:true,color:green,text:" to return to spawn at any time!"}]

gamemode adventure
$execute if score $defgm_plot_$(id) var matches 1 run gamemode survival
$execute if score $defgm_plot_$(id) var matches 2 run gamemode creative
attribute @s minecraft:block_interaction_range base reset
$execute if score $nointeract_plot_$(id) var matches 1 unless score @s id = $$(id) id run attribute @s minecraft:block_interaction_range base set 0
clear
effect clear
data remove entity @s fall_distance
data remove entity @s Motion
data modify entity @s Health set value 20
function code:commandrunner/all_plottag_clear
$tp @s $(id)0000 64 0
$spawnpoint @s $(id)0000 64 0
$scoreboard players set $$(id) id $(id)
execute if entity @s[tag=myplot] run gamemode creative
tellraw @s[tag=myplot] [{italic:true,color:gray,text:"{"},{italic:true,color:yellow,text:"I"},{italic:true,color:gray,text:"} "},{italic:true,color:green,text:"welcome to your plot! check the trigger commands by doing "},{italic:true,color:light_purple,text:"/trigger"},{italic:true,color:green,text:" to see some commands you can run, or settings you can change for your plot!"}]

tag @s remove myplot