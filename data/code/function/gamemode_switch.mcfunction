scoreboard players reset @s gamemode

execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

execute if entity @s[gamemode=creative] run tag @s add switching_gma
execute if entity @s[gamemode=adventure] run tag @s add switching_gms
execute if entity @s[gamemode=survival] run tag @s add switching_gmc

gamemode adventure @s[tag=switching_gma]
gamemode survival @s[tag=switching_gms]
gamemode creative @s[tag=switching_gmc]

tellraw @s[tag=switching_gma] [{color:green,text:"set gamemode to "},{color:gold,text:"adventure"}]
tellraw @s[tag=switching_gms] [{color:green,text:"set gamemode to "},{color:gold,text:"survival"}]
tellraw @s[tag=switching_gmc] [{color:green,text:"set gamemode to "},{color:gold,text:"creative"}]

tag @s remove switching_gma
tag @s remove switching_gms
tag @s remove switching_gmc