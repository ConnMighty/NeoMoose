scoreboard players reset @s default_visitor_gamemode

execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

$execute unless score $defgm_plot_$(id) var matches 1.. run tag @s add switching_visitor_gms
$execute if score $defgm_plot_$(id) var matches 1 run tag @s add switching_visitor_gmc
$execute if score $defgm_plot_$(id) var matches 2 run tag @s add switching_visitor_gma

$execute if entity @s[tag=switching_visitor_gms] run scoreboard players set $defgm_plot_$(id) var 1
$execute if entity @s[tag=switching_visitor_gmc] run scoreboard players set $defgm_plot_$(id) var 2
$execute if entity @s[tag=switching_visitor_gma] run scoreboard players set $defgm_plot_$(id) var 0

tellraw @s[tag=switching_visitor_gms] [{color:green,text:"visitors will now be set to "},{color:gold,text:"survival"},{color:green,text:" mode when joining your plot"}]
tellraw @s[tag=switching_visitor_gmc] [{color:green,text:"visitors will now be set to "},{color:gold,text:"creative"},{color:green,text:" mode when joining your plot"}]
tellraw @s[tag=switching_visitor_gma] [{color:green,text:"visitors will now be set to "},{color:gold,text:"adventure"},{color:green,text:" mode when joining your plot"}]

tag @s remove switching_visitor_gms
tag @s remove switching_visitor_gmc
tag @s remove switching_visitor_gma