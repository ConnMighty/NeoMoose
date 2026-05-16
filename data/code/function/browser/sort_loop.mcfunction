execute unless score $plots_length var matches 1.. run return fail

execute store result storage browser temp.length int 1 run scoreboard players get $plots_length var
scoreboard players remove $plots_length var 1
execute store result storage browser temp.length_less1 int 1 run scoreboard players get $plots_length var

function code:browser/sort with storage browser temp
