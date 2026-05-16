data modify entity @s transformation set value {translation:[-0.501,-0.001,-0.501],left_rotation:{angle:0,axis:[0,0,0]},right_rotation:{angle:0,axis:[0,0,0]},scale:[1.01,1.01,1.01]}
data modify entity @s brightness set value {block:0,sky:15}

playsound block.stone.place master @a ~ ~ ~
setblock ~ ~ ~ barrier

tag @s add old
