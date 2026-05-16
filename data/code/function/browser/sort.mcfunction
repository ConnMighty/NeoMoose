scoreboard players set $browser_math.num1 var 0
scoreboard players set $browser_math.num0 var 0

$execute store result score $browser_math.num1 var run data get storage browser plots[$(length)].$(compare)
$execute store result score $browser_math.num0 var run data get storage browser plots[$(length_less1)].$(compare)

execute unless score $browser_math.num1 var > $browser_math.num0 var run return run function code:browser/sort_loop
scoreboard players add $test_for_sorted var 1
$data modify storage browser temp.plot0 set from storage browser plots[$(length_less1)]
$data modify storage browser plots[$(length_less1)] set from storage browser plots[$(length)]
$data modify storage browser plots[$(length)] set from storage browser temp.plot0

function code:browser/sort_loop
