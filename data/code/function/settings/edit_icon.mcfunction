scoreboard players reset @s edit_icon

execute unless items entity @s weapon.mainhand * run return run tellraw @s {color:red,italic:1b,text:"Hold the item you want to use as the icon in your mainhand"}
$data modify storage browser plots[{join_id:$(id)}].item set from entity @s SelectedItem.id