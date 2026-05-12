scoreboard players reset @s edit_desc

execute unless items entity @s weapon.offhand writable_book unless items entity @s weapon.offhand written_book run return run tellraw @s {color:red,italic:1b,text:"Write your description in a book and quill, then hold it in your offhand and run this command again!"}

$data modify storage temp edit_browser_item.$(id).string set from entity @s equipment.offhand.components."minecraft:writable_book_content".pages[0].raw
$data modify storage temp edit_browser_item.$(id).string set from entity @s equipment.offhand.components."minecraft:written_book_content".pages[0].raw

scoreboard players reset @s edit_browser_item_math
$execute store result score @s edit_browser_item_math run data get storage temp edit_browser_item.$(id).string
execute if score @s edit_browser_item_math matches 65.. run return run tellraw @s {color:red,italic:1b,text:"Description too long! Maximum 64 characters!"}
$data modify storage temp edit_browser_item.$(id).id set value $(id)
$execute if score @s edit_browser_item_math matches 33.. run data modify storage temp edit_browser_item.$(id).string_beginning set string storage temp edit_browser_item.$(id).string 0 32
$execute if score @s edit_browser_item_math matches 33.. run data modify storage temp edit_browser_item.$(id).string set string storage temp edit_browser_item.$(id).string 33
$execute if score @s edit_browser_item_math matches 33.. run function code:settings/merge_string with storage temp edit_browser_item.$(id)

$data modify storage browser plots[{join_id:$(id)}].desc set from storage temp edit_browser_item.$(id).string
