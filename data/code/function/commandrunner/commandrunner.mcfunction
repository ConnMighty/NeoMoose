# cooldown
scoreboard players set $commandrunner_cooldown count 2

# redstone powering
tag @s remove powered
execute if block ~ ~1 ~ redstone_wire unless block ~ ~1 ~ redstone_wire[power=0] run tag @s add powered
execute if block ~ ~2 ~ redstone_wire unless block ~ ~2 ~ redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~ redstone_wire unless block ~1 ~ ~ redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~ redstone_wire unless block ~-1 ~ ~ redstone_wire[power=0] run tag @s add powered
execute if block ~ ~ ~1 redstone_wire unless block ~ ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~ ~ ~-1 redstone_wire unless block ~ ~ ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~1 redstone_wire unless block ~1 ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~-1 redstone_wire unless block ~-1 ~1 ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~1 ~ ~-1 redstone_wire unless block ~1 ~ ~-1 redstone_wire[power=0] run tag @s add powered
execute if block ~-1 ~ ~1 redstone_wire unless block ~-1 ~ ~1 redstone_wire[power=0] run tag @s add powered
execute if block ~ ~1 ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~2 ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~ #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~1 ~ ~-1 #lespowerables[powered=true] run tag @s add powered
execute if block ~-1 ~ ~1 #lespowerables[powered=true] run tag @s add powered
execute if block ~ ~1 ~ redstone_block run tag @s add powered
execute if block ~ ~2 ~ redstone_block run tag @s add powered
execute if block ~1 ~ ~ redstone_block run tag @s add powered
execute if block ~-1 ~ ~ redstone_block run tag @s add powered
execute if block ~ ~ ~1 redstone_block run tag @s add powered
execute if block ~ ~ ~-1 redstone_block run tag @s add powered
execute if block ~1 ~ ~1 redstone_block run tag @s add powered
execute if block ~-1 ~ ~-1 redstone_block run tag @s add powered
execute if block ~1 ~ ~-1 redstone_block run tag @s add powered
execute if block ~-1 ~ ~1 redstone_block run tag @s add powered
execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run tag @s add powered

# align and stuff
data modify entity @s transformation set value {translation:[-0.501,-0.001,-0.501],left_rotation:{angle:0,axis:[0,0,0]},right_rotation:{angle:0,axis:[0,0,0]},scale:[1.01,1.01,1.01]}
tp @s ~ ~ ~ 0 0

# commandrunner ui
## barrel
execute if block ~ ~-1 ~ air run setblock ~ ~-1 ~ barrel{lock:{components:{item_model:"command_block"}},CustomName:'click with "Command Runner Block" item'}
## kill when broken
execute unless block ~ ~ ~ barrier if block ~ ~-1 ~ barrel run setblock ~ ~-1 ~ air destroy
$execute unless block ~ ~ ~ barrier run data remove storage runner "$(UUID)"
execute unless block ~ ~ ~ barrier run kill @s
## items
execute unless items block ~ ~-1 ~ container.15 * run item replace block ~ ~-1 ~ container.15 with red_stained_glass_pane[item_name="Selector",lore=["defaults to any players","standing on the block","when unset"]]
execute unless items block ~ ~-1 ~ container.11 * run item replace block ~ ~-1 ~ container.11 with red_stained_glass_pane[item_name="Command",lore=["name a paper item using","an anvil. name it the","command you want to run,","and put it here"]]
execute unless items block ~ ~-1 ~ container.13 * run item replace block ~ ~-1 ~ container.13 with red_stained_glass_pane[item_name="Always Active?",lore=["put any item here to","make it always active"]]
execute unless items block ~ ~-1 ~ container.10 * run item replace block ~ ~-1 ~ container.10 with black_stained_glass_pane[item_name="Command Input",lore=["name any item and put it here.","some commands will use the","name of this item for","part of the command","","Tip: try putting a book and","quill in this slot if you want","some advanced action..."]]
execute unless items block ~ ~-1 ~ container.16 * run item replace block ~ ~-1 ~ container.16 with black_stained_glass_pane[item_name="Selector Input",lore=["name any item and put it here.","some selectors will use the","name of this item for","part of the selector"]]
execute unless items block ~ ~-1 ~ container.20 * run item replace block ~ ~-1 ~ container.20 with diamond[item_name="See All Commands"]
execute unless items block ~ ~-1 ~ container.24 * run item replace block ~ ~-1 ~ container.24 with diamond[item_name="See All Selectors"]

execute if items block ~ ~-1 ~ container.10 writable_book run item modify block ~ ~-1 ~ container.10 {function:"set_name",name:"Write json inside me!"}
execute if items block ~ ~-1 ~ container.10 writable_book run item modify block ~ ~-1 ~ container.10 {function:"set_lore",lore:[{color:gray,italic:false,text:"The current command accepts no json tags"}],mode:"replace_all"}
execute if items block ~ ~-1 ~ container.10 writable_book if items block ~ ~-1 ~ container.11 *[custom_name="summon"] run item modify block ~ ~-1 ~ container.10 {function:"set_lore",lore:\
    [\
        {color:gray,italic:false,text:"Required json tags:"},\
        "",\
        {color:gray,italic:false,text:"entity"},\
        {color:dark_gray,text:"entity to be summoned"},\
        "",\
        {color:gray,italic:false,text:"x"},\
        "",\
        {color:gray,italic:false,text:"y"},\
        "",\
        {color:gray,italic:false,text:"z"},\
        "",\
        {color:dark_gray,text:"(coordinates are all relative)"},\
        "",\
        {color:gray,italic:false,text:"nbt"},\
        {color:dark_gray,text:"the mob's nbt"},\
        {color:dark_gray,text:'example use: {nbt:"{NoAI:1b}"}'},\
    ],\
mode:"replace_all"}
execute if items block ~ ~-1 ~ container.10 writable_book if items block ~ ~-1 ~ container.11 *[custom_name="setblock"] run item modify block ~ ~-1 ~ container.10 {function:"set_lore",lore:\
    [\
        {color:gray,italic:false,text:"Required json tags:"},\
        "",\
        {color:gray,italic:false,text:"block"},\
        {color:dark_gray,text:"block that will be placed"},\
        "",\
        {color:gray,italic:false,text:"x"},\
        "",\
        {color:gray,italic:false,text:"y"},\
        "",\
        {color:gray,italic:false,text:"z"},\
        "",\
        {color:dark_gray,text:"(coordinates are all relative)"},\
    ],\
mode:"replace_all"}

$data modify storage runner "$(UUID)".UUID set from entity @s UUID

# get command
$data modify storage runner "$(UUID)".function set value ""
$data modify storage runner "$(UUID)".function set from block ~ ~-1 ~ Items[{Slot:11b}].components.minecraft:custom_name
$execute if items block ~ ~-1 ~ container.11 paper[custom_name="kill"] if items block ~ ~-1 ~ container.15 #danger_selectors unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run data modify storage runner "$(UUID)".function set value ""
$execute if items block ~ ~-1 ~ container.11 paper[custom_name="tp"] if items block ~ ~-1 ~ container.15 #danger_selectors unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run data modify storage runner "$(UUID)".function set value ""
# danger commands go here ^^^

# get input
$data modify storage runner "$(UUID)".UUID set value "$(UUID)"
$execute at @s if items block ~ ~-1 ~ container.11 paper run data modify storage runner "$(UUID)".input set value ""
$execute at @s if items block ~ ~-1 ~ container.11 paper run data modify storage runner "$(UUID)".input set from block ~ ~-1 ~ Items[{Slot:10b}].components.minecraft:custom_name
$execute at @s if items block ~ ~-1 ~ container.11 paper if items block ~ ~-1 ~ container.10 writable_book run data modify storage runner "$(UUID)".input set from block ~ ~-1 ~ Items[{Slot:10b}].components."minecraft:writable_book_content".pages[0].raw
$execute at @s if items block ~ ~-1 ~ container.11 paper if items block ~ ~-1 ~ container.10 writable_book run function code:commandrunner/make_json_not_string with storage runner "$(UUID)"

# get selector input
$data modify storage runner "$(UUID)".selector_input set value ""
$execute store result storage runner "$(UUID)".selector_input int 1 run data get block ~ ~-1 ~ Items[{Slot:16b}].components.minecraft:custom_name

$data modify storage runner "$(UUID)".selector_input_type set value "armor_stand"
$data modify storage runner "$(UUID)".selector_input_type set from block ~ ~-1 ~ Items[{Slot:16b}].components.minecraft:custom_name


# run the command
$execute if entity @s[tag=powered] run function code:commandrunner/selector with storage runner "$(UUID)"