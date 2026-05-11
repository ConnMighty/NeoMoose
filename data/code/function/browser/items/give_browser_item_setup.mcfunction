data modify storage browser temp.give_item.name set from entity @s bukkit.lastKnownName
execute store result storage browser temp.give_item.join_id int 1 run scoreboard players get @s id 
function code:browser/items/give_browser_item with storage browser temp.give_item
tag @s add got_initial_browser_item
