$execute store result score $x_testfor var run data get storage runner "$(UUID)".x 100
execute unless score $x_testfor var matches -500000..500000 run return run execute as @a[distance=..2500] if score @s currentplot = @s id at @s run title @s actionbar "can not place blocks that far out from your plot!"

$setblock ~$(x) ~$(y) ~$(z) $(block){}