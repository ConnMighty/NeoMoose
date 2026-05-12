scoreboard players reset @s edit_name

execute unless items entity @s weapon.offhand writable_book unless items entity @s weapon.offhand written_book run return run tellraw @s {color:red,italic:1b,text:"Write your world name in a book and quill, then hold it in your offhand and run this command again!"}

$data modify storage temp edit_browser_item.$(id).string set from entity @s equipment.offhand.components."minecraft:writable_book_content".pages[0].raw
$data modify storage temp edit_browser_item.$(id).string set from entity @s equipment.offhand.components."minecraft:written_book_content".pages[0].raw

scoreboard players reset @s edit_browser_item_math
$execute store result score @s edit_browser_item_math run data get storage temp edit_browser_item.$(id).string
execute if score @s edit_browser_item_math matches 33.. run return run tellraw @s {color:red,italic:1b,text:"World name too long! Maximum 32 characters!"}

$data modify storage browser plots[{join_id:$(id)}].name set from storage temp edit_browser_item.$(id).string
