scoreboard players reset @s edit_name

execute unless items entity @s weapon.offhand writable_book run return run tellraw @s {color:red,italic:1b,text:"Write your world name in a book and quill, then hold it in your offhand and run this command again!"}
$data modify storage browser plots[{join_id:$(id)}].name set from entity @s equipment.offhand.components."minecraft:writable_book_content".pages[0].raw
$data modify storage browser plots[{join_id:$(id)}].name set from entity @s equipment.offhand.components."minecraft:written_book_content".pages[0].raw
