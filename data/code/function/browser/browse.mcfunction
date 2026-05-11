$scoreboard players set @s browser_page $(page)

# calculate what plots go on this page
scoreboard players set $const_17 var 17
$scoreboard players set $browse_math var $(page)
scoreboard players operation $browse_math var *= $const_17 var
scoreboard players remove $browse_math var 17

# navigation arrows
execute unless score @s browser_page matches 1 run item replace block 0 32 0 container.18 with spectral_arrow[item_name={color:"light_purple",text:"previous page"},custom_data={neobrowser:left}]
execute if score @s browser_page matches 1 run item replace block 0 32 0 container.18 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.19 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.19 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.20 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.21 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.22 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.23 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.24 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
item replace block 0 32 0 container.25 with gray_stained_glass_pane[item_name="",custom_data={neobrowser:empty}]
execute unless score @s browser_page matches 2147483647 run item replace block 0 32 0 container.26 with spectral_arrow[item_name={color:"light_purple",text:"next page"},custom_data={neobrowser:right}]

# plots on this page
function code:browser/prep_load_slot {slot:0}
function code:browser/prep_load_slot {slot:1}
function code:browser/prep_load_slot {slot:2}
function code:browser/prep_load_slot {slot:3}
function code:browser/prep_load_slot {slot:4}
function code:browser/prep_load_slot {slot:5}
function code:browser/prep_load_slot {slot:6}
function code:browser/prep_load_slot {slot:7}
function code:browser/prep_load_slot {slot:8}
function code:browser/prep_load_slot {slot:9}
function code:browser/prep_load_slot {slot:10}
function code:browser/prep_load_slot {slot:11}
function code:browser/prep_load_slot {slot:12}
function code:browser/prep_load_slot {slot:13}
function code:browser/prep_load_slot {slot:14}
function code:browser/prep_load_slot {slot:15}
function code:browser/prep_load_slot {slot:16}
function code:browser/prep_load_slot {slot:17}

# open ui
inventory @s block 0 32 0 <aqua><b><i><shadow:#70550b>NeoBrowser
