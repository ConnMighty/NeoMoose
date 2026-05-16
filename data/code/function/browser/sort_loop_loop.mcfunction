#execute if score $plots_length_master var matches 0 run schedule function code:browser/sort_start 1s
execute unless score $plots_length_master var matches 1.. run return run scoreboard players remove $plots_length_master var 1

execute unless score $test_for_sorted var matches 1.. run return run scoreboard players set $test_for_sorted var 1
scoreboard players reset $test_for_sorted var
execute store result score $plots_length var run data get storage browser plots
function code:browser/sort_loop

scoreboard players remove $plots_length_master var 1
