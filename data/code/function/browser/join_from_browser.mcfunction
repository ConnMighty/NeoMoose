execute at @s run playsound ui.button.click master @s ~ ~ ~ .3

item replace block 0 30 0 container.0 from entity @s player.cursor
data modify storage browser temp.joining.id set from block 0 30 0 Items[{Slot:0b}].components."minecraft:custom_data".join
function code:join with storage browser temp.joining

inventory @s close
