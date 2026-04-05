scoreboard players reset @s allow_visits

execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

$execute unless score $visitsallowed_plot_$(id) var matches 1.. run tag @s add switching_allow_visits_no
$execute if score $visitsallowed_plot_$(id) var matches 1 run tag @s add switching_allow_visits_yes


$execute if entity @s[tag=switching_allow_visits_no] run scoreboard players set $visitsallowed_plot_$(id) var 1
$execute if entity @s[tag=switching_allow_visits_yes] run scoreboard players set $visitsallowed_plot_$(id) var 0

tellraw @s[tag=switching_allow_visits_no] [{color:green,text:"visiting this plot is now "},{color:red,text:"disabled"}]
tellraw @s[tag=switching_allow_visits_yes] [{color:green,text:"visiting this plot is now "},{color:gold,text:"enabled"}]

tag @s remove switching_allow_visits_no
tag @s remove switching_allow_visits_yes