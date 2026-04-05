scoreboard players reset @s allow_visitor_block_interactions

execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

$execute unless score $nointeract_plot_$(id) var matches 1.. run tag @s add switching_allow_visitor_block_interactions_no
$execute if score $nointeract_plot_$(id) var matches 1 run tag @s add switching_allow_visitor_block_interactions_yes


$execute if entity @s[tag=switching_allow_visitor_block_interactions_no] run scoreboard players set $nointeract_plot_$(id) var 1
$execute if entity @s[tag=switching_allow_visitor_block_interactions_yes] run scoreboard players set $nointeract_plot_$(id) var 0

tellraw @s[tag=switching_allow_visitor_block_interactions_no] [{color:green,text:"visitor block interactions for this plot are now "},{color:red,text:"disabled"}]
tellraw @s[tag=switching_allow_visitor_block_interactions_yes] [{color:green,text:"visitor block interactions for this plot are now "},{color:gold,text:"enabled"}]

tag @s remove switching_allow_visitor_block_interactions_no
tag @s remove switching_allow_visitor_block_interactions_yes