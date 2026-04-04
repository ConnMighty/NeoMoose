scoreboard players set $commandrunner_cooldown count 2

tag @s remove powered

# redstone powering
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

kill @e[type=command_block_minecart]

#execute at @s if entity @s[tag=powered] run data modify entity @s block_state set value {Name:"green_wool"}
#execute at @s unless data block ~ ~ ~ {powered:1b} run data modify entity @s block_state set value {Name:"command_block"}
#execute at @s unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run data modify entity @s block_state set value {Name:"light_gray_stained_glass"}
data modify entity @s transformation set value {translation:[-0.501,-0.001,-0.501],left_rotation:{angle:0,axis:[0,0,0]},right_rotation:{angle:0,axis:[0,0,0]},scale:[1.01,1.01,1.01]}

tp @s ~ ~ ~ 0 0

# commandrunner ui
execute if block ~ ~-1 ~ air run setblock ~ ~-1 ~ barrel{lock:{components:{item_model:"command_block"}},CustomName:'click with "Command Runner Block" item'}

execute unless block ~ ~ ~ barrier if block ~ ~-1 ~ barrel run setblock ~ ~-1 ~ air
$execute unless block ~ ~ ~ barrier run data remove storage runner "$(UUID)"
execute unless block ~ ~ ~ barrier run kill @s
execute unless items block ~ ~-1 ~ container.15 * run item replace block ~ ~-1 ~ container.15 with red_stained_glass_pane[item_name="Selector",lore=["defaults to any players","standing on the block","when unset"]]
execute unless items block ~ ~-1 ~ container.11 * run item replace block ~ ~-1 ~ container.11 with red_stained_glass_pane[item_name="Command",lore=["name a paper item using","an anvil. name it the","command you want to run,","and put it here"]]
#execute unless items block ~ ~-1 ~ container.4 * run item replace block ~ ~-1 ~ container.4 with red_stained_glass_pane[item_name="Impulse or Repeating",lore=["put any item here to","select repeating, or leave","empty to select impulse"]]
execute unless items block ~ ~-1 ~ container.13 * run item replace block ~ ~-1 ~ container.13 with red_stained_glass_pane[item_name="Always Active?",lore=["put any item here to","make it always active"]]
execute unless items block ~ ~-1 ~ container.10 * run item replace block ~ ~-1 ~ container.10 with black_stained_glass_pane[item_name="Command Input",lore=["name any item and put it here.","some commands will use the","name of this item for","part of the command"]]
execute unless items block ~ ~-1 ~ container.16 * run item replace block ~ ~-1 ~ container.16 with black_stained_glass_pane[item_name="Selector Input",lore=["name any item and put it here.","some selectors will use the","name of this item for","part of the selector"]]
execute unless items block ~ ~-1 ~ container.20 * run item replace block ~ ~-1 ~ container.20 with diamond[item_name="See All Commands"]
execute unless items block ~ ~-1 ~ container.24 * run item replace block ~ ~-1 ~ container.24 with diamond[item_name="See All Selectors"]

#$execute at @s if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run data modify storage runner "$(UUID)".effect set value "default title"
#$execute at @s if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run data modify storage runner "$(UUID)".effect set from block ~ ~-1 ~ Items[{Slot:10b}].components.minecraft:custom_name
#$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
#    if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run function code:commandrunner/commandrunner_specials/title with storage runner "$(UUID)"
#$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
#    if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run function code:commandrunner/commandrunner_specials/title with storage runner "$(UUID)"

$data modify storage runner "$(UUID)".selector_input set value ""
$data modify storage runner "$(UUID)".selector_input set from block ~ ~-1 ~ Items[{Slot:16b}].components.minecraft:custom_name

$data modify storage runner "$(UUID)".UUID set value "$(UUID)"
$execute at @s if items block ~ ~-1 ~ container.11 paper run data modify storage runner "$(UUID)".input set value ""
$execute at @s if items block ~ ~-1 ~ container.11 paper run data modify storage runner "$(UUID)".input set from block ~ ~-1 ~ Items[{Slot:10b}].components.minecraft:custom_name
$execute at @s if items block ~ ~-1 ~ container.11 paper if items block ~ ~-1 ~ container.10 writable_book run data modify storage runner "$(UUID)".input set from block ~ ~-1 ~ Items[{Slot:10b}].components."minecraft:writable_book_content".pages[0].raw

# title
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run function code:commandrunner/commandrunner_specials/title with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="title"] run function code:commandrunner/commandrunner_specials/title with storage runner "$(UUID)"

# summon
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="summon"] run function code:commandrunner/commandrunner_specials/summon with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="summon"] run function code:commandrunner/commandrunner_specials/summon with storage runner "$(UUID)"

# effect
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="effect"] run function code:commandrunner/commandrunner_specials/effect with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="effect"] run function code:commandrunner/commandrunner_specials/effect with storage runner "$(UUID)"

# sethp
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="sethp"] run function code:commandrunner/commandrunner_specials/sethp with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="sethp"] run function code:commandrunner/commandrunner_specials/sethp with storage runner "$(UUID)"

# tagadd
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tagadd"] run function code:commandrunner/commandrunner_specials/tagadd with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tagadd"] run function code:commandrunner/commandrunner_specials/tagadd with storage runner "$(UUID)"

# tagremove
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tagremove"] run function code:commandrunner/commandrunner_specials/tagremove with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tagremove"] run function code:commandrunner/commandrunner_specials/tagremove with storage runner "$(UUID)"

# below commands WILL NOT RUN if you are in ALWAYS ACTIVE mode and are using a danger tag
# below commands WILL NOT RUN if you are in ALWAYS ACTIVE mode and are using a danger tag
# below commands WILL NOT RUN if you are in ALWAYS ACTIVE mode and are using a danger tag
# below commands WILL NOT RUN if you are in ALWAYS ACTIVE mode and are using a danger tag
execute if items block ~ ~-1 ~ container.15 nautilus_shell unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run return fail
execute if items block ~ ~-1 ~ container.15 emerald unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run return fail
execute if items block ~ ~-1 ~ container.15 gold_ingot unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run return fail
execute if items block ~ ~-1 ~ container.15 name_tag unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run return fail
execute if items block ~ ~-1 ~ container.15 leather unless items block ~ ~-1 ~ container.13 red_stained_glass_pane run return fail

# kill
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="kill"] \
    run data modify storage runner "$(UUID)".command set value "kill @s"
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="kill"] \
    run function code:commandrunner/commandrunner_selector with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="kill"] \
    run function code:commandrunner/commandrunner_selector with storage runner "$(UUID)"

# tp
$execute at @s if items block ~ ~-1 ~ container.11 paper[custom_name="tp"] run data modify storage runner "$(UUID)".coords set value ""
$execute at @s if items block ~ ~-1 ~ container.11 paper[custom_name="tp"] run data modify storage runner "$(UUID)".coords set from block ~ ~-1 ~ Items[{Slot:10b}].components.minecraft:custom_name
$execute if items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s if entity @s[tag=powered] \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tp"] run function code:commandrunner/commandrunner_specials/tp with storage runner "$(UUID)"
$execute unless items block ~ ~-1 ~ container.13 red_stained_glass_pane at @s \
    if items block ~ ~-1 ~ container.11 paper[custom_name="tp"] run function code:commandrunner/commandrunner_specials/tp with storage runner "$(UUID)"
