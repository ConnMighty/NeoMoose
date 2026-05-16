$data modify storage browser plots[{join_id:$(join_id)}].players set value -1
$execute store result storage browser plots[{join_id:$(join_id)}].players int 1 run execute if entity @a[scores={currentplot=$(join_id)}]

data modify storage browser temp.compare set value "players"
function code:browser/sort_start
