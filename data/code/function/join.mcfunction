scoreboard players reset @s join
$execute if score @s id = $$(id) id run tag @s add myplot

# visiting disabled message
$execute unless entity @s[tag=myplot] if score $visitsallowed_plot_$(id) var matches 1 run return run tellraw @s {color:red,text:"Sorry, but it looks like this plot has visiting disabled!"}

function code:reset_plot_players_prep with entity @s

# leave message
$data modify storage temp leave_message_2.plot_id set value $(id)
$data modify storage temp leave_message_2.plot_name set from storage browser plots[{join_id:$(id)}].name
execute store result storage temp leave_message_2.id int 1 run scoreboard players get @s currentplot
data modify storage temp leave_message_2.myname set from entity @s bukkit.lastKnownName
function code:tick/leave_message_2 with storage temp leave_message_2

# increase visits by 1
scoreboard players reset @s visit_math
$execute store result score @s visit_math run data get storage browser plots[{join_id:$(id)}].visits
scoreboard players add @s visit_math 1
$execute store result storage browser plots[{join_id:$(id)}].visits int 1 run scoreboard players get @s visit_math

# update current plot
$scoreboard players set @s currentplot $(id)

# info message
tellraw @s[tag=!myplot] [{italic:true,color:gray,text:"{"},{italic:true,color:yellow,text:"I"},{italic:true,color:gray,text:"} "},{italic:true,color:green,text:"you can use "},{italic:true,color:light_purple,text:"/trigger spawn"},{italic:true,color:green,text:" to return to spawn at any time!"}]

# join message
$tellraw @a[scores={currentplot=$(id)}] [{color:gray,text:"["},{color:light_purple,text:"+"},{color:gray,text:"] "},{selector:"@s"}]

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
#execute if entity @s[tag=myplot] run give @s written_book[written_book_content={author:"",title:"NeoMoose Official Guide!",pages:[{text:"Check triggers while in your own plot to see some commands you can run, or settings you can change for your plot! \n\n(More things will be added here in the future)"}]}]

tag @s remove myplot

$data modify storage join id set value $(id)

$data modify storage browser temp.join_id set value $(id)
function code:browser/calc_plot_player with storage browser temp
