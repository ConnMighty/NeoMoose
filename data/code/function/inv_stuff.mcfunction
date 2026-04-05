$execute if items entity @s container.$(n) *[can_break] run item modify entity @a container.$(n) \
    {function:set_components,components:{"can_break":[{blocks:[]}],"can_place_on":[{blocks:[]}],"tooltip_display":{hidden_components:["can_break","can_place_on"]}}}
$execute if items entity @s container.$(n) *[can_place_on] run item modify entity @a container.$(n) \
    {function:set_components,components:{"can_break":[{blocks:[]}],"can_place_on":[{blocks:[]}],"tooltip_display":{hidden_components:["can_break","can_place_on"]}}}

$execute store success storage minecraft:temp "$(my_uuid)".detect int 1 run data get entity @s Inventory[$(n)].components."minecraft:entity_data".Pos
$execute if data storage temp {"$(my_uuid)":{detect:1}} run clear @s #spwneggs