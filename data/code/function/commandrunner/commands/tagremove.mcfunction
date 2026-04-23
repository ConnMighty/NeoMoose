$scoreboard players set $tag_testfor var $(input)
execute unless score $tag_testfor var matches 1..99 run return fail

$tag @s remove plottag_$(input)
