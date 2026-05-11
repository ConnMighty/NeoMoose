$item replace block 0 32 0 container.$(slot) with air

execute store result storage browser temp.id int 1 run scoreboard players get $browse_math var
$data modify storage browser temp.slot set value $(slot)
function code:browser/load_slot with storage browser temp
scoreboard players add $browse_math var 1
